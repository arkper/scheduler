package com.modern.office.forms.services;

import com.modern.office.config.ClientMappings;
import lombok.RequiredArgsConstructor;
import org.eclipse.collections.api.factory.Maps;
import org.eclipse.collections.api.tuple.Pair;
import org.eclipse.collections.impl.tuple.Tuples;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class SignRequestService {
    private final ConcurrentLinkedQueue<Map<String, String>> requestQueue = new ConcurrentLinkedQueue<>();
    private final Map<String, Boolean> subscriberState = Maps.mutable.empty();

    public void put(final Map<String, String> requestData) {
        this.requestQueue.add(requestData);
    }

    public Map<String, String> get() {
        return this.requestQueue.poll();
    }

    public List<Map<String, String>> list() {
        return this.requestQueue.stream().toList();
    }

    public Map<String, String> getBySubscriber(final String subscriber) {
        if (this.subscriberState.getOrDefault(subscriber, false)) {
            return null;
        }
        return this.requestQueue
                .stream().filter(r -> subscriber.equals(r.get("subscriber")))
                .findFirst()
                .map(it -> {
                    this.requestQueue.remove(it);
                    this.subscriberState.put(subscriber, true);
                    return it;
                })
                .orElse(null);
    }

    public void setSubscriberState(final String subscriber, Boolean state){
        this.subscriberState.put(subscriber, state);
    }

    public List<Pair<String, Boolean>> getSubscriberState(){
        return this.subscriberState
                .entrySet()
                .stream()
                .map(e -> Tuples.pair(e.getKey(), e.getValue()))
                .collect(Collectors.toList());
    }
}
