/**
 * Created with IntelliJ IDEA.
 * User: mayday
 * Date: 26/7/13
 * Time: 11:02 PM
 * To change this template use File | Settings | File Templates.
 */

$('.dropdown-toggle').dropdown();
$('.dropdown input, .dropdown label').click(function(e) {
    e.stopPropagation();
});
