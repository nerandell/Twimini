<style>
    #map_canvas {
        width: 670px;
        height: 500px;
    }

    #MapModal {
        width: 700px;
        height: 600px;
    }
</style>

<div id="MapModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Map</h4>
            </div>
            <div class="modal-body">
                <div id="map_canvas"></div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->