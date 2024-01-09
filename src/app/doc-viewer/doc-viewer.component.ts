import { Component } from '@angular/core';
import { Store } from '@ngrx/store';
import { AppState } from '../store/reducers';
import { Document } from '../store/model/patient.model';
import { OfficeApiService } from '../services/office-api.service';

@Component({
  selector: 'app-doc-viewer',
  templateUrl: './doc-viewer.component.html',
  styleUrls: ['./doc-viewer.component.scss']
})
export class DocViewerComponent {
  constructor(private store: Store<AppState>, private apiService: OfficeApiService){

    this.store.select(state => state.selectedDocument.document)
      .subscribe((document) => {this.onDocumentSelected(document)});
  }

  srcFile: string = "";

  onDocumentSelected(document: Document) {
    const docLink = this.apiService.getDocFile(document.docLink);

    console.log("Sending request for: " + docLink);
    this.srcFile = "/forms/" + docLink;
  }
}
