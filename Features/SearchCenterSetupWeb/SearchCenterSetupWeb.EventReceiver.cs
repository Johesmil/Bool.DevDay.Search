namespace Bool.DevDay.Search.Features.SearchCenterSetupWeb
{
    using System.Runtime.InteropServices;
    using Microsoft.SharePoint;

    /// <summary>
    /// This class handles events raised during feature activation, deactivation, installation, uninstallation, and upgrade.
    /// </summary>
    /// <remarks>
    /// The GUID attached to this class may be used during packaging and should not be modified.
    /// </remarks>
    [Guid("8849e912-2e87-42cd-b890-832d2e8668a3")]
    public class SearchCenterSetupWebEventReceiver : SPFeatureReceiver
    {
        /// <summary>
        /// Handles the feature activated event.
        /// </summary>
        /// <param name="properties">
        /// The properties.
        /// </param>
        public override void FeatureActivated(SPFeatureReceiverProperties properties)
        {
            var web = properties.Feature.Parent as SPWeb;
        }
    }
}