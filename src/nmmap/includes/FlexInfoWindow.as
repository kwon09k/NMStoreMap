package nmmap.includes
{
	import com.mapquest.tilemap.DefaultInfoWindow;
	import com.mapquest.tilemap.TileMap;
	import com.mapquest.tilemap.util.*;
	import com.mapquest.tilemap.util.drawing.ShapeUtil;
	
	import flash.events.TimerEvent;
	import flash.text.TextFormat;
	import flash.utils.Dictionary;
	import flash.utils.Timer;
	
	import mx.containers.Canvas;
	import mx.core.Application;
	import mx.core.UIComponent;
	import mx.events.FlexEvent;
	import mx.core.FlexGlobals;

	/**
	 * 
	 * 
	 */	
	public class FlexInfoWindow extends DefaultInfoWindow
	{
		private var container : Canvas;
		private static var DEFAULT_CONTENT_WIDTH : Number = 180;
		private static var DEFAULT_CONTENT_HEIGHT : Number = 80;
		private static var contentSizeCache : Dictionary;
		private var _tfu:TextFieldUtil = new TextFieldUtil();
		
		/**
		 * constructor
		 * @param map
		 * 
		 */		
		public function FlexInfoWindow(map:TileMap)
		{
			contentSizeCache = new Dictionary();
			super(map);
		}
		
		/**
		 * sets the content of the info window. The content of the rollover window must inherit from UIComponent else
		 * an exception will be thrown
		 * @param value
		 * 
		 */		
		override public function set content(value:Object) : void
		{
			if ( !(value is UIComponent) )
				throw new Error( "content must be of type UIComponent. set map.infoWindow to DefaultInfoWindow" );
			
			if ( value.width == 0 && value.height == 0 )
			{
				value.width = 180;
				value.height = 80;
			}
			
			if ( !contentSizeCache[ UIComponent( value ).uid ] )
			{
				contentSizeCache[ UIComponent( value ).uid ] = { width : value.width, height : value.height };
			}
			else
			{
				var cacheItem : Object = contentSizeCache[ UIComponent( value ).uid ];
				value.width = cacheItem.width;
				value.height = cacheItem.height;
			}
			
			DEFAULT_CONTENT_WIDTH = value.width;
			DEFAULT_CONTENT_HEIGHT = value.height;
			
			_backgroundWidth = DEFAULT_CONTENT_WIDTH + 2 * horizontalMargin;
			_backgroundHeight = DEFAULT_CONTENT_HEIGHT + ( 2 * verticalMargin ) + 30;
			
			var cf:TextFormat = new TextFormat();
			cf.font = "Arial";
			cf.size = 11;
			
			this._contentField.defaultTextFormat = cf;
			this._contentField.setTextFormat(cf);
			this._contentField.visible= false;
			
			var tf:TextFormat = new TextFormat();
			tf.font = "Arial";
			tf.size = 12;
			tf.bold = true;
			
			this._titleField.defaultTextFormat = tf;
			this._titleField.setTextFormat( tf );
			_dirtyPlacement = true;
			
			this._content = value as UIComponent;
			
			draw();
			
			if ( !container )
			{
				initializeContainer();
			}
			else
			{
				container.setActualSize( DEFAULT_CONTENT_WIDTH, DEFAULT_CONTENT_HEIGHT );
				container.height = DEFAULT_CONTENT_HEIGHT;
				container.width = DEFAULT_CONTENT_WIDTH;
				container.removeAllChildren();
				
				if ( !UIComponent( _content ).initialized )
				{
					_content.addEventListener( FlexEvent.CREATION_COMPLETE, onContentCreationComplete, false, 0, true );
					UIComponent( _content ).visible = false;
					UIComponent( _content ).includeInLayout = false;
					//Application.application.addChild( _content );
					FlexGlobals.topLevelApplication.addElement( _content );
				}
				else
				{
					_content.width = DEFAULT_CONTENT_WIDTH;
					_content.height = DEFAULT_CONTENT_HEIGHT;
					container.addChild( _content );
				}
			}					
		}

		
		private function initializeContainer() : void
		{
			container = new Canvas();
			container.addEventListener( FlexEvent.CREATION_COMPLETE, onCreationComplete, false, 0, true );
			container.visible = false;
			/*container.includeInLayout = false;*/
			UIComponent( _content ).visible = false;
			container.addChild( UIComponent( _content ) );
			FlexGlobals.topLevelApplication.addElement( container );
		}
		
		private function onCreationComplete( event : FlexEvent ) : void
		{
			FlexGlobals.topLevelApplication.removeElement( container );
			container.x = horizontalMargin;
			container.y = verticalMargin + 30;
			container.setActualSize( DEFAULT_CONTENT_WIDTH, DEFAULT_CONTENT_HEIGHT );
			container.height = DEFAULT_CONTENT_HEIGHT;
			container.width = DEFAULT_CONTENT_WIDTH;
			container.includeInLayout = true;
			addChild( container );
			container.visible = true;
			
			var timer : Timer = new Timer(100);
			timer.addEventListener( TimerEvent.TIMER, onTimerComplete, false, 0, true );
			timer.start();
		}
			
		private function onTimerComplete( event : TimerEvent ) : void
		{
			var timer : Timer = event.currentTarget as Timer;
			timer.stop();
			timer.reset();
			timer = null;
			UIComponent( _content ).visible = true;
		}
		
		private function onContentCreationComplete( event : FlexEvent ) : void
		{
			FlexGlobals.topLevelApplication.addElement( _content );
			UIComponent( _content ).visible = true;
			UIComponent( _content ).includeInLayout = true;
			container.addChild( _content );
		}
		
		override protected function placeItems():void 
		{
			// set the title into place
			var concatText:String = "...";
			if (this._titleFieldOrigText) {
				this._titleField.htmlText = this._titleFieldOrigText;
			}
			var titleWidth : Number = this._backgroundWidth - ( 2 * horizontalMargin ) - _closeButton.width - 5;
			_titleField.htmlText = this._tfu.sizeTextField(_titleField, titleWidth, concatText);
			_titleField.y = verticalMargin + 1;
			_titleField.x = horizontalMargin + 1;
			
			//clear the old background color before setting a new rectangle
			this._titleBackground.graphics.clear();
			
			//set the title color into place
			if ( !isNaN( _backgroundWidth ) )
			{
				this._titleBackground.graphics.beginFill(this._titleBackgroundColor);
				this._titleBackground.graphics.drawRect(verticalMargin + 2, horizontalMargin , this._backgroundWidth - ( 2 * verticalMargin + 2 ) - _closeButton.width - 3 , _closeButton.height);
				this._titleBackground.graphics.endFill();
			}
			
			//_closeButton.x = _backgroundWidth - horizontalMargin - _closeButton.width;
			//_closeButton.y = verticalMargin + 2;
			var posX:Number;
			if (!this._content) {
				posX = (this._contentField.width * -.5);
			}
			else {
				posX = (this._content.width * -.5);
			}
			posX += (this.triangleWidth + (this.horizontalMargin * 2));
			
			this._closeButton.y = 0 - (this._closeButton.height * .40);
			this._closeButton.x = this._titleBackground.width + (this._horizontalMargin * 2) + (this._contentField.width * .29);
		}
		
		override protected function draw() : void
		{			
			placeItems();
			
			var halfTriWid:Number = _triangleWidth / 2;
			var dBorder:Number = _borderSize * 2;
			var fillWidth:Number = _backgroundWidth - dBorder;
			var fillHeight:Number = _backgroundHeight - dBorder;
			//var triX:Number = _borderSize + _triangleXOffset;
			
			var invertTriangle : Boolean = ( orientation == ORIENTATION_BOTTOM_LEFT || orientation == ORIENTATION_BOTTOM_RIGHT ) ? true : false;
			var triX:Number =  ( orientation == ORIENTATION_BOTTOM_LEFT || orientation == ORIENTATION_TOP_LEFT ) ? 
				_backgroundWidth - _borderSize - _triangleXOffset - _triangleWidth : _borderSize + _triangleXOffset;
			
			this._bkg.graphics.clear();
			this._shadow.graphics.clear();
			
			//draw shadow
			if (_useShadow && !isNaN(_backgroundWidth) && !isNaN(_backgroundHeight) ) 
			{
				this._shadow.graphics.beginFill(0x000000, this._shadowAlpha);
				ShapeUtil.drawBackgroundWithTriangle(
					_shadow, 
					_shadowOffsetX, 
					_shadowOffsetY, 
					_backgroundWidth, 
					_backgroundHeight, 
					_roundedBackground, 
					_backgroundEllipseWidth, 
					_backgroundEllipseHeight,
					_triangleWidth, _triangleHeight, 
					triX + _shadowOffsetX,
					invertTriangle);
				this._shadow.graphics.endFill();
			}
			
			if ( !isNaN(_backgroundWidth) && !isNaN(_backgroundHeight) )
			{
				//draw border
				this._bkg.graphics.beginFill(_borderColor, _borderAlpha);
				
				ShapeUtil.drawBackgroundWithTriangle(
					_bkg, 
					0, 
					0, 
					_backgroundWidth, 
					_backgroundHeight, 
					_roundedBackground, 
					_backgroundEllipseWidth, 
					_backgroundEllipseHeight, 
					_triangleWidth + _borderSize,
					_triangleHeight + _borderSize, 
					triX - _borderSize / 2,invertTriangle);
				
				ShapeUtil.drawBackgroundWithTriangle(
					_bkg, 
					_borderSize, 
					_borderSize, 
					fillWidth, 
					fillHeight, 
					_roundedBackground, 
					_backgroundEllipseWidth, 
					_backgroundEllipseHeight, 
					_triangleWidth, 
					_triangleHeight,
					triX,invertTriangle);
				this._bkg.graphics.endFill();
				
				//drawbackground
				this._bkg.graphics.beginFill(_contentBackgroundColor, _contentBackgroundAlpha);
				ShapeUtil.drawBackgroundWithTriangle(
					_bkg, 
					_borderSize, 
					_borderSize, 
					fillWidth, 
					fillHeight, 
					_roundedBackground, 
					_backgroundEllipseWidth, 
					_backgroundEllipseHeight, 
					_triangleWidth, 
					_triangleHeight,
					triX,invertTriangle);
				this._bkg.graphics.endFill();				
			}	
		}
	}
}