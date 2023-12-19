import { Component, ElementRef, EventEmitter, Input, OnInit, Output, ViewChild } from '@angular/core';
import { Subject } from 'rxjs';
import SignaturePad from 'signature_pad';

@Component({
  selector: 'app-sig-pad',
  templateUrl: './sig-pad.component.html',
  styleUrls: ['./sig-pad.component.scss']
})
export class SigPadComponent implements OnInit{
  signatureNeeded!: boolean;
  signaturePad!: SignaturePad;
  @ViewChild('canvas') canvasEl!: ElementRef;
  signatureImg!: string;

  constructor() { }

  @Output() signed: EventEmitter<string> = new EventEmitter<string>();
  @Input() reset: Subject<boolean> = new Subject();

  ngOnInit(): void {
    this.reset.subscribe(_ => this.clearPad());
  }
  
  ngAfterViewInit() {
    this.signaturePad = new SignaturePad(this.canvasEl.nativeElement);
  }

  startDrawing(event: Event) {
    // works in device not in browser
  }

  moved(event: Event) {
    // works in device not in browser
  }

  clearPad() {
    this.signaturePad.clear();
  }

  savePad() {
    const base64Data = this.signaturePad.toDataURL();
    this.signatureImg = base64Data;
    this.signatureNeeded = this.signaturePad.isEmpty();
    if (!this.signatureNeeded) {
      this.signatureNeeded = false;
    }
    this.signed.emit(this.signatureImg);
  }
}
