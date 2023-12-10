import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { NgxExtendedPdfViewerModule } from 'ngx-extended-pdf-viewer';

@Component({
  selector: 'app-doc-viewer',
  templateUrl: './doc-viewer.component.html',
  styleUrls: ['./doc-viewer.component.scss']
})
export class DocViewerComponent {
  constructor(private router: Router){
    this.srcFile = "/forms/" + this.router.getCurrentNavigation()?.extras.state?.['fileName'];
  }

  srcFile: string = "";
}
