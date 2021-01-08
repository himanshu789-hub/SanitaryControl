if (!window.brandRequestUrl) {
	console.error('variables not found');
}
import * as $ from 'jquery';
var elements = {
    BrandHolder:'#BrandsHolder'
};
if(!$(elements.BrandHolder).length>0)
{
    console.error('Brand Holder Element Not Found');
}
const PropertiesName = {
	ImagePath: 'imagePath',
	Name: 'name',
};

function buildMargque(data) {
    if (data.length > 0) 
    Array.from(data).map(function (value, index) {
         const marque = $('<margue behavior="scroll" direction="left" scrollamount="5">');
         
    });
}
