namespace Bool.DevDay.Search.Features.SearchCenterSetupSite
{
    using System.Runtime.InteropServices;
    using Microsoft.SharePoint;

    /// <summary>
    /// This class handles events raised during feature activation, deactivation, installation, uninstallation, and upgrade.
    /// </summary>
    /// <remarks>
    /// The GUID attached to this class may be used during packaging and should not be modified.
    /// </remarks>
    [Guid("2f8faea4-79db-4c6b-88a7-a70e8ccbf6ff")]
    public class SearchCenterSetupSiteEventReceiver : SPFeatureReceiver
    {
        /// <summary>
        /// Handles the feature activated event.
        /// </summary>
        /// <param name="properties">
        /// The properties.
        /// </param>
        public override void FeatureActivated(SPFeatureReceiverProperties properties)
        {
            var site = properties.Feature.Parent as SPSite;
        }
    }
}