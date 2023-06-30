// To parse this JSON data, do
//
//     final userIdStory = userIdStoryFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserIdStory userIdStoryFromJson(String str) => UserIdStory.fromJson(json.decode(str));

String userIdStoryToJson(UserIdStory data) => json.encode(data.toJson());

class UserIdStory {
    UserIdStory({
         required this.broadcast,
         required this.reel,
         required this.status,
    });

    dynamic broadcast;
    Reel ?reel;
    String ?status;

    factory UserIdStory.fromJson(Map<String, dynamic> json) => UserIdStory(
        broadcast: json["broadcast"],
        reel: json["reel"] == null ? null : Reel.fromJson(json["reel"]),
        status: json["status"] == null ? null : json["status"],
    );

    Map<String, dynamic> toJson() => {
        "broadcast": broadcast,
        "reel": reel == null ? null : reel?.toJson(),
        "status": status == null ? null : status,
    };
}

class Reel {
    Reel({
         required this.id,
         required this.latestReelMedia,
         required this.expiringAt,
         required this.seen,
         required this.canReply,
         required this.canGifQuickReply,
         required this.canReshare,
         required this.canReactWithAvatar,
         required this.reelType,
         required this.adExpiryTimestampInMillis,
         required this.isCtaStickerAvailable,
         required this.user,
         required this.items,
         required this.prefetchCount,
         required this.hasBestiesMedia,
         required this.mediaCount,
         required this.mediaIds,
         required this.hasFanClubMedia,
         required this.disabledReplyTypes,
    });

    String ?id;
    int ?latestReelMedia;
    int ?expiringAt;
    int ?seen;
    bool ?canReply;
    bool ?canGifQuickReply;
    bool? canReshare;
    bool? canReactWithAvatar;
    String? reelType;
    dynamic adExpiryTimestampInMillis;
    dynamic isCtaStickerAvailable;
    ReelUser ?user;
    List<Item>? items;
    int ?prefetchCount;
    bool ?hasBestiesMedia;
    int? mediaCount;
    List<String>? mediaIds;
    bool? hasFanClubMedia;
    List<String>? disabledReplyTypes;

    factory Reel.fromJson(Map<String, dynamic> json) => Reel(
        id: json["id"] == null ? null : json["id"],
        latestReelMedia: json["latest_reel_media"] == null ? null : json["latest_reel_media"],
        expiringAt: json["expiring_at"] == null ? null : json["expiring_at"],
        seen: json["seen"] == null ? null : json["seen"],
        canReply: json["can_reply"] == null ? null : json["can_reply"],
        canGifQuickReply: json["can_gif_quick_reply"] == null ? null : json["can_gif_quick_reply"],
        canReshare: json["can_reshare"] == null ? null : json["can_reshare"],
        canReactWithAvatar: json["can_react_with_avatar"] == null ? null : json["can_react_with_avatar"],
        reelType: json["reel_type"] == null ? null : json["reel_type"],
        adExpiryTimestampInMillis: json["ad_expiry_timestamp_in_millis"],
        isCtaStickerAvailable: json["is_cta_sticker_available"],
        user: json["user"] == null ? null : ReelUser.fromJson(json["user"]),
        items: json["items"] == null ? null : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        prefetchCount: json["prefetch_count"] == null ? null : json["prefetch_count"],
        hasBestiesMedia: json["has_besties_media"] == null ? null : json["has_besties_media"],
        mediaCount: json["media_count"] == null ? null : json["media_count"],
        mediaIds: json["media_ids"] == null ? null : List<String>.from(json["media_ids"].map((x) => x)),
        hasFanClubMedia: json["has_fan_club_media"] == null ? null : json["has_fan_club_media"],
        disabledReplyTypes: json["disabled_reply_types"] == null ? null : List<String>.from(json["disabled_reply_types"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "latest_reel_media": latestReelMedia == null ? null : latestReelMedia,
        "expiring_at": expiringAt == null ? null : expiringAt,
        "seen": seen == null ? null : seen,
        "can_reply": canReply == null ? null : canReply,
        "can_gif_quick_reply": canGifQuickReply == null ? null : canGifQuickReply,
        "can_reshare": canReshare == null ? null : canReshare,
        "can_react_with_avatar": canReactWithAvatar == null ? null : canReactWithAvatar,
        "reel_type": reelType == null ? null : reelType,
        "ad_expiry_timestamp_in_millis": adExpiryTimestampInMillis,
        "is_cta_sticker_available": isCtaStickerAvailable,
        "user": user == null ? null : user?.toJson(),
        "items": items == null ? null : List<dynamic>.from(items!.map((x) => x.toJson())),
        "prefetch_count": prefetchCount == null ? null : prefetchCount,
        "has_besties_media": hasBestiesMedia == null ? null : hasBestiesMedia,
        "media_count": mediaCount == null ? null : mediaCount,
        "media_ids": mediaIds == null ? null : List<dynamic>.from(mediaIds!.map((x) => x)),
        "has_fan_club_media": hasFanClubMedia == null ? null : hasFanClubMedia,
        "disabled_reply_types": disabledReplyTypes == null ? null : List<dynamic>.from(disabledReplyTypes!.map((x) => x)),
    };
}

class Item {
    Item({
         required this.takenAt,
         required this.pk,
         required this.id,
         required this.deviceTimestamp,
         required this.mediaType,
         required this.code,
         required this.clientCacheKey,
         required this.filterType,
         required this.isUnifiedVideo,
         required this.shouldRequestAds,
         required this.originalMediaHasVisualReplyMedia,
         required this.captionIsEdited,
         required this.likeAndViewCountsDisabled,
         required this.commercialityStatus,
         required this.isPaidPartnership,
         required this.isVisualReplyCommenterNoticeEnabled,
         required this.clipsTabPinnedUserIds,
         required this.hasDelayedMetadata,
         required this.fundraiserTag,
         required this.captionPosition,
         required this.isReelMedia,
         required this.photoOfYou,
         required this.isOrganicProductTaggingEligible,
         required this.canSeeInsightsAsBrand,
         required this.user,
         required this.imageVersions2,
         required this.originalWidth,
         required this.originalHeight,
         required this.caption,
         required this.commentInformTreatment,
         required this.sharingFrictionInfo,
         required this.isDashEligible,
         required this.videoDashManifest,
         required this.videoCodec,
         required this.numberOfQualities,
         required this.videoVersions,
         required this.hasAudio,
         required this.videoDuration,
         required this.canViewerSave,
         required this.isInProfileGrid,
         required this.profileGridControlEnabled,
         required this.organicTrackingToken,
         required this.expiringAt,
         required this.importedTakenAt,
         required this.crosspost,
         required this.hasSharedToFb,
         required this.productType,
         required this.deletedReason,
         required this.integrityReviewDecision,
         required this.commerceIntegrityReviewDecision,
         required this.musicMetadata,
         required this.isArtistPick,
         required this.canReshare,
         required this.canReply,
         required this.canSendPrompt,
         required this.isFirstTake,
         required this.isRollcallV2,
         required this.createdFromAddYoursBrowsing,
         required this.storyStaticModels,
         required this.supportsReelReactions,
         required this.canSendCustomEmojis,
         required this.showOneTapFbShareTooltip,
    });

    int ?takenAt;
    String ?pk;
    String ?id;
    int ?deviceTimestamp;
    int ?mediaType;
    String ?code;
    String ?clientCacheKey;
    int ?filterType;
    bool ?isUnifiedVideo;
    bool ?shouldRequestAds;
    bool ?originalMediaHasVisualReplyMedia;
    bool? captionIsEdited;
    bool ?likeAndViewCountsDisabled;
    String ?commercialityStatus;
    bool ?isPaidPartnership;
    bool? isVisualReplyCommenterNoticeEnabled;
    List<dynamic>? clipsTabPinnedUserIds;
    bool ?hasDelayedMetadata;
    FundraiserTag ?fundraiserTag;
    double ?captionPosition;
    bool? isReelMedia;
    bool ?photoOfYou;
    bool? isOrganicProductTaggingEligible;
    bool ?canSeeInsightsAsBrand;
    ItemUser ?user;
    ImageVersions2? imageVersions2;
    int ?originalWidth;
    int ?originalHeight;
    dynamic ?caption;
    CommentInformTreatment ?commentInformTreatment;
    SharingFrictionInfo ?sharingFrictionInfo;
    int ?isDashEligible;
    String? videoDashManifest;
    String ?videoCodec;
    int? numberOfQualities;
    List<VideoVersion> ?videoVersions;
    bool ?hasAudio;
    double? videoDuration;
    bool? canViewerSave;
    bool? isInProfileGrid;
    bool?profileGridControlEnabled;
    String ?organicTrackingToken;
    int ?expiringAt;
    int ?importedTakenAt;
    List<String>? crosspost;
    int? hasSharedToFb;
    String ?productType;
    int? deletedReason;
    String?integrityReviewDecision;
    dynamic commerceIntegrityReviewDecision;
    dynamic musicMetadata;
    bool? isArtistPick;
    bool ?canReshare;
    bool ?canReply;
    bool ?canSendPrompt;
    bool ?isFirstTake;
    bool ?isRollcallV2;
    bool ?createdFromAddYoursBrowsing;
    List<dynamic> ?storyStaticModels;
    bool ?supportsReelReactions;
    bool ?canSendCustomEmojis;
    bool ?showOneTapFbShareTooltip;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        takenAt: json["taken_at"] == null ? null : json["taken_at"],
        pk: json["pk"] == null ? null : json["pk"],
        id: json["id"] == null ? null : json["id"],
        deviceTimestamp: json["device_timestamp"] == null ? null : json["device_timestamp"],
        mediaType: json["media_type"] == null ? null : json["media_type"],
        code: json["code"] == null ? null : json["code"],
        clientCacheKey: json["client_cache_key"] == null ? null : json["client_cache_key"],
        filterType: json["filter_type"] == null ? null : json["filter_type"],
        isUnifiedVideo: json["is_unified_video"] == null ? null : json["is_unified_video"],
        shouldRequestAds: json["should_request_ads"] == null ? null : json["should_request_ads"],
        originalMediaHasVisualReplyMedia: json["original_media_has_visual_reply_media"] == null ? null : json["original_media_has_visual_reply_media"],
        captionIsEdited: json["caption_is_edited"] == null ? null : json["caption_is_edited"],
        likeAndViewCountsDisabled: json["like_and_view_counts_disabled"] == null ? null : json["like_and_view_counts_disabled"],
        commercialityStatus: json["commerciality_status"] == null ? null : json["commerciality_status"],
        isPaidPartnership: json["is_paid_partnership"] == null ? null : json["is_paid_partnership"],
        isVisualReplyCommenterNoticeEnabled: json["is_visual_reply_commenter_notice_enabled"] == null ? null : json["is_visual_reply_commenter_notice_enabled"],
        clipsTabPinnedUserIds: json["clips_tab_pinned_user_ids"] == null ? null : List<dynamic>.from(json["clips_tab_pinned_user_ids"].map((x) => x)),
        hasDelayedMetadata: json["has_delayed_metadata"] == null ? null : json["has_delayed_metadata"],
        fundraiserTag: json["fundraiser_tag"] == null ? null : FundraiserTag.fromJson(json["fundraiser_tag"]),
        captionPosition: json["caption_position"] == null ? null : json["caption_position"],
        isReelMedia: json["is_reel_media"] == null ? null : json["is_reel_media"],
        photoOfYou: json["photo_of_you"] == null ? null : json["photo_of_you"],
        isOrganicProductTaggingEligible: json["is_organic_product_tagging_eligible"] == null ? null : json["is_organic_product_tagging_eligible"],
        canSeeInsightsAsBrand: json["can_see_insights_as_brand"] == null ? null : json["can_see_insights_as_brand"],
        user: json["user"] == null ? null : ItemUser.fromJson(json["user"]),
        imageVersions2: json["image_versions2"] == null ? null : ImageVersions2.fromJson(json["image_versions2"]),
        originalWidth: json["original_width"] == null ? null : json["original_width"],
        originalHeight: json["original_height"] == null ? null : json["original_height"],
        caption: json["caption"],
        commentInformTreatment: json["comment_inform_treatment"] == null ? null : CommentInformTreatment.fromJson(json["comment_inform_treatment"]),
        sharingFrictionInfo: json["sharing_friction_info"] == null ? null : SharingFrictionInfo.fromJson(json["sharing_friction_info"]),
        isDashEligible: json["is_dash_eligible"] == null ? null : json["is_dash_eligible"],
        videoDashManifest: json["video_dash_manifest"] == null ? null : json["video_dash_manifest"],
        videoCodec: json["video_codec"] == null ? null : json["video_codec"],
        numberOfQualities: json["number_of_qualities"] == null ? null : json["number_of_qualities"],
        videoVersions: json["video_versions"] == null ? null : List<VideoVersion>.from(json["video_versions"].map((x) => VideoVersion.fromJson(x))),
        hasAudio: json["has_audio"] == null ? null : json["has_audio"],
        videoDuration: json["video_duration"] == null ? null : json["video_duration"].toDouble(),
        canViewerSave: json["can_viewer_save"] == null ? null : json["can_viewer_save"],
        isInProfileGrid: json["is_in_profile_grid"] == null ? null : json["is_in_profile_grid"],
        profileGridControlEnabled: json["profile_grid_control_enabled"] == null ? null : json["profile_grid_control_enabled"],
        organicTrackingToken: json["organic_tracking_token"] == null ? null : json["organic_tracking_token"],
        expiringAt: json["expiring_at"] == null ? null : json["expiring_at"],
        importedTakenAt: json["imported_taken_at"] == null ? null : json["imported_taken_at"],
        crosspost: json["crosspost"] == null ? null : List<String>.from(json["crosspost"].map((x) => x)),
        hasSharedToFb: json["has_shared_to_fb"] == null ? null : json["has_shared_to_fb"],
        productType: json["product_type"] == null ? null : json["product_type"],
        deletedReason: json["deleted_reason"] == null ? null : json["deleted_reason"],
        integrityReviewDecision: json["integrity_review_decision"] == null ? null : json["integrity_review_decision"],
        commerceIntegrityReviewDecision: json["commerce_integrity_review_decision"],
        musicMetadata: json["music_metadata"],
        isArtistPick: json["is_artist_pick"] == null ? null : json["is_artist_pick"],
        canReshare: json["can_reshare"] == null ? null : json["can_reshare"],
        canReply: json["can_reply"] == null ? null : json["can_reply"],
        canSendPrompt: json["can_send_prompt"] == null ? null : json["can_send_prompt"],
        isFirstTake: json["is_first_take"] == null ? null : json["is_first_take"],
        isRollcallV2: json["is_rollcall_v2"] == null ? null : json["is_rollcall_v2"],
        createdFromAddYoursBrowsing: json["created_from_add_yours_browsing"] == null ? null : json["created_from_add_yours_browsing"],
        storyStaticModels: json["story_static_models"] == null ? null : List<dynamic>.from(json["story_static_models"].map((x) => x)),
        supportsReelReactions: json["supports_reel_reactions"] == null ? null : json["supports_reel_reactions"],
        canSendCustomEmojis: json["can_send_custom_emojis"] == null ? null : json["can_send_custom_emojis"],
        showOneTapFbShareTooltip: json["show_one_tap_fb_share_tooltip"] == null ? null : json["show_one_tap_fb_share_tooltip"],
    );

    Map<String, dynamic> toJson() => {
        "taken_at": takenAt == null ? null : takenAt,
        "pk": pk == null ? null : pk,
        "id": id == null ? null : id,
        "device_timestamp": deviceTimestamp == null ? null : deviceTimestamp,
        "media_type": mediaType == null ? null : mediaType,
        "code": code == null ? null : code,
        "client_cache_key": clientCacheKey == null ? null : clientCacheKey,
        "filter_type": filterType == null ? null : filterType,
        "is_unified_video": isUnifiedVideo == null ? null : isUnifiedVideo,
        "should_request_ads": shouldRequestAds == null ? null : shouldRequestAds,
        "original_media_has_visual_reply_media": originalMediaHasVisualReplyMedia == null ? null : originalMediaHasVisualReplyMedia,
        "caption_is_edited": captionIsEdited == null ? null : captionIsEdited,
        "like_and_view_counts_disabled": likeAndViewCountsDisabled == null ? null : likeAndViewCountsDisabled,
        "commerciality_status": commercialityStatus == null ? null : commercialityStatus,
        "is_paid_partnership": isPaidPartnership == null ? null : isPaidPartnership,
        "is_visual_reply_commenter_notice_enabled": isVisualReplyCommenterNoticeEnabled == null ? null : isVisualReplyCommenterNoticeEnabled,
        "clips_tab_pinned_user_ids": clipsTabPinnedUserIds == null ? null : List<dynamic>.from(clipsTabPinnedUserIds!.map((x) => x)),
        "has_delayed_metadata": hasDelayedMetadata == null ? null : hasDelayedMetadata,
        "fundraiser_tag": fundraiserTag == null ? null : fundraiserTag?.toJson(),
        "caption_position": captionPosition == null ? null : captionPosition,
        "is_reel_media": isReelMedia == null ? null : isReelMedia,
        "photo_of_you": photoOfYou == null ? null : photoOfYou,
        "is_organic_product_tagging_eligible": isOrganicProductTaggingEligible == null ? null : isOrganicProductTaggingEligible,
        "can_see_insights_as_brand": canSeeInsightsAsBrand == null ? null : canSeeInsightsAsBrand,
        "user": user == null ? null : user?.toJson(),
        "image_versions2": imageVersions2 == null ? null : imageVersions2?.toJson(),
        "original_width": originalWidth == null ? null : originalWidth,
        "original_height": originalHeight == null ? null : originalHeight,
        "caption": caption,
        "comment_inform_treatment": commentInformTreatment == null ? null : commentInformTreatment?.toJson(),
        "sharing_friction_info": sharingFrictionInfo == null ? null : sharingFrictionInfo?.toJson(),
        "is_dash_eligible": isDashEligible == null ? null : isDashEligible,
        "video_dash_manifest": videoDashManifest == null ? null : videoDashManifest,
        "video_codec": videoCodec == null ? null : videoCodec,
        "number_of_qualities": numberOfQualities == null ? null : numberOfQualities,
        "video_versions": videoVersions == null ? null : List<dynamic>.from(videoVersions!.map((x) => x.toJson())),
        "has_audio": hasAudio == null ? null : hasAudio,
        "video_duration": videoDuration == null ? null : videoDuration,
        "can_viewer_save": canViewerSave == null ? null : canViewerSave,
        "is_in_profile_grid": isInProfileGrid == null ? null : isInProfileGrid,
        "profile_grid_control_enabled": profileGridControlEnabled == null ? null : profileGridControlEnabled,
        "organic_tracking_token": organicTrackingToken == null ? null : organicTrackingToken,
        "expiring_at": expiringAt == null ? null : expiringAt,
        "imported_taken_at": importedTakenAt == null ? null : importedTakenAt,
        "crosspost": crosspost == null ? null : List<dynamic>.from(crosspost!.map((x) => x)),
        "has_shared_to_fb": hasSharedToFb == null ? null : hasSharedToFb,
        "product_type": productType == null ? null : productType,
        "deleted_reason": deletedReason == null ? null : deletedReason,
        "integrity_review_decision": integrityReviewDecision == null ? null : integrityReviewDecision,
        "commerce_integrity_review_decision": commerceIntegrityReviewDecision,
        "music_metadata": musicMetadata,
        "is_artist_pick": isArtistPick == null ? null : isArtistPick,
        "can_reshare": canReshare == null ? null : canReshare,
        "can_reply": canReply == null ? null : canReply,
        "can_send_prompt": canSendPrompt == null ? null : canSendPrompt,
        "is_first_take": isFirstTake == null ? null : isFirstTake,
        "is_rollcall_v2": isRollcallV2 == null ? null : isRollcallV2,
        "created_from_add_yours_browsing": createdFromAddYoursBrowsing == null ? null : createdFromAddYoursBrowsing,
        "story_static_models": storyStaticModels == null ? null : List<dynamic>.from(storyStaticModels!.map((x) => x)),
        "supports_reel_reactions": supportsReelReactions == null ? null : supportsReelReactions,
        "can_send_custom_emojis": canSendCustomEmojis == null ? null : canSendCustomEmojis,
        "show_one_tap_fb_share_tooltip": showOneTapFbShareTooltip == null ? null : showOneTapFbShareTooltip,
    };
}

class CommentInformTreatment {
    CommentInformTreatment({
         required this.shouldHaveInformTreatment,
         required this.text,
         required this.url,
         required this.actionType,
    });

    bool ?shouldHaveInformTreatment;
    String ?text;
    dynamic url;
    dynamic actionType;

    factory CommentInformTreatment.fromJson(Map<String, dynamic> json) => CommentInformTreatment(
        shouldHaveInformTreatment: json["should_have_inform_treatment"] == null ? null : json["should_have_inform_treatment"],
        text: json["text"] == null ? null : json["text"],
        url: json["url"],
        actionType: json["action_type"],
    );

    Map<String, dynamic> toJson() => {
        "should_have_inform_treatment": shouldHaveInformTreatment == null ? null : shouldHaveInformTreatment,
        "text": text == null ? null : text,
        "url": url,
        "action_type": actionType,
    };
}

class FundraiserTag {
    FundraiserTag({
         required this.hasStandaloneFundraiser,
    });

    bool ?hasStandaloneFundraiser;

    factory FundraiserTag.fromJson(Map<String, dynamic> json) => FundraiserTag(
        hasStandaloneFundraiser: json["has_standalone_fundraiser"] == null ? null : json["has_standalone_fundraiser"],
    );

    Map<String, dynamic> toJson() => {
        "has_standalone_fundraiser": hasStandaloneFundraiser == null ? null : hasStandaloneFundraiser,
    };
}

class ImageVersions2 {
    ImageVersions2({
         required this.candidates,
    });

    List<Candidate> ?candidates;

    factory ImageVersions2.fromJson(Map<String, dynamic> json) => ImageVersions2(
        candidates: json["candidates"] == null ? null : List<Candidate>.from(json["candidates"].map((x) => Candidate.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "candidates": candidates == null ? null : List<dynamic>.from(candidates!.map((x) => x.toJson())),
    };
}

class Candidate {
    Candidate({
         required this.width,
         required this.height,
         required this.url,
         required this.scansProfile,
    });

    int ?width;
    int ?height;
    String ?url;
    ScansProfile ?scansProfile;

    factory Candidate.fromJson(Map<String, dynamic> json) => Candidate(
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
        url: json["url"] == null ? null : json["url"],
        scansProfile: json["scans_profile"] == null ? null : scansProfileValues.map![json["scans_profile"]],
    );

    Map<String, dynamic> toJson() => {
        "width": width == null ? null : width,
        "height": height == null ? null : height,
        "url": url == null ? null : url,
        "scans_profile": scansProfile == null ? null : scansProfileValues.reverse![scansProfile],
    };
}

enum ScansProfile { E15 }

final scansProfileValues = EnumValues({
    "e15": ScansProfile.E15
});

class SharingFrictionInfo {
    SharingFrictionInfo({
         required this.shouldHaveSharingFriction,
         required this.bloksAppUrl,
         required this.sharingFrictionPayload,
    });

    bool ?shouldHaveSharingFriction;
    dynamic bloksAppUrl;
    dynamic sharingFrictionPayload;

    factory SharingFrictionInfo.fromJson(Map<String, dynamic> json) => SharingFrictionInfo(
        shouldHaveSharingFriction: json["should_have_sharing_friction"] == null ? null : json["should_have_sharing_friction"],
        bloksAppUrl: json["bloks_app_url"],
        sharingFrictionPayload: json["sharing_friction_payload"],
    );

    Map<String, dynamic> toJson() => {
        "should_have_sharing_friction": shouldHaveSharingFriction == null ? null : shouldHaveSharingFriction,
        "bloks_app_url": bloksAppUrl,
        "sharing_friction_payload": sharingFrictionPayload,
    };
}

class ItemUser {
    ItemUser({
         required this.pk,
         required this.username,
         required this.isVerified,
         required this.profilePicId,
         required this.profilePicUrl,
         required this.pkId,
         required this.isPrivate,
         required this.fullName,
         required this.accountBadges,
         required this.hasAnonymousProfilePicture,
         required this.fanClubInfo,
         required this.transparencyProductEnabled,
         required this.isFavorite,
         required this.isUnpublished,
    });

    String ?pk;
    String ?username;
    bool ?isVerified;
    String ?profilePicId;
    String ?profilePicUrl;
    String ?pkId;
    bool ?isPrivate;
    String ?fullName;
    List<dynamic>? accountBadges;
    bool ?hasAnonymousProfilePicture;
    FanClubInfo? fanClubInfo;
    bool? transparencyProductEnabled;
    bool? isFavorite;
    bool? isUnpublished;

    factory ItemUser.fromJson(Map<String, dynamic> json) => ItemUser(
        pk: json["pk"] == null ? null : json["pk"],
        username: json["username"] == null ? null : json["username"],
        isVerified: json["is_verified"] == null ? null : json["is_verified"],
        profilePicId: json["profile_pic_id"] == null ? null : json["profile_pic_id"],
        profilePicUrl: json["profile_pic_url"] == null ? null : json["profile_pic_url"],
        pkId: json["pk_id"] == null ? null : json["pk_id"],
        isPrivate: json["is_private"] == null ? null : json["is_private"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        accountBadges: json["account_badges"] == null ? null : List<dynamic>.from(json["account_badges"].map((x) => x)),
        hasAnonymousProfilePicture: json["has_anonymous_profile_picture"] == null ? null : json["has_anonymous_profile_picture"],
        fanClubInfo: json["fan_club_info"] == null ? null : FanClubInfo.fromJson(json["fan_club_info"]),
        transparencyProductEnabled: json["transparency_product_enabled"] == null ? null : json["transparency_product_enabled"],
        isFavorite: json["is_favorite"] == null ? null : json["is_favorite"],
        isUnpublished: json["is_unpublished"] == null ? null : json["is_unpublished"],
    );

    Map<String, dynamic> toJson() => {
        "pk": pk == null ? null : pk,
        "username": username == null ? null : username,
        "is_verified": isVerified == null ? null : isVerified,
        "profile_pic_id": profilePicId == null ? null : profilePicId,
        "profile_pic_url": profilePicUrl == null ? null : profilePicUrl,
        "pk_id": pkId == null ? null : pkId,
        "is_private": isPrivate == null ? null : isPrivate,
        "full_name": fullName == null ? null : fullName,
        "account_badges": accountBadges == null ? null : List<dynamic>.from(accountBadges!.map((x) => x)),
        "has_anonymous_profile_picture": hasAnonymousProfilePicture == null ? null : hasAnonymousProfilePicture,
        "fan_club_info": fanClubInfo == null ? null : fanClubInfo?.toJson(),
        "transparency_product_enabled": transparencyProductEnabled == null ? null : transparencyProductEnabled,
        "is_favorite": isFavorite == null ? null : isFavorite,
        "is_unpublished": isUnpublished == null ? null : isUnpublished,
    };
}

class FanClubInfo {
    FanClubInfo({
         required this.fanClubId,
         required this.fanClubName,
         required this.isFanClubReferralEligible,
         required this.fanConsiderationPageRevampEligiblity,
         required this.isFanClubGiftingEligible,
    });

    dynamic fanClubId;
    dynamic fanClubName;
    dynamic isFanClubReferralEligible;
    dynamic fanConsiderationPageRevampEligiblity;
    dynamic isFanClubGiftingEligible;

    factory FanClubInfo.fromJson(Map<String, dynamic> json) => FanClubInfo(
        fanClubId: json["fan_club_id"],
        fanClubName: json["fan_club_name"],
        isFanClubReferralEligible: json["is_fan_club_referral_eligible"],
        fanConsiderationPageRevampEligiblity: json["fan_consideration_page_revamp_eligiblity"],
        isFanClubGiftingEligible: json["is_fan_club_gifting_eligible"],
    );

    Map<String, dynamic> toJson() => {
        "fan_club_id": fanClubId,
        "fan_club_name": fanClubName,
        "is_fan_club_referral_eligible": isFanClubReferralEligible,
        "fan_consideration_page_revamp_eligiblity": fanConsiderationPageRevampEligiblity,
        "is_fan_club_gifting_eligible": isFanClubGiftingEligible,
    };
}

class VideoVersion {
    VideoVersion({
        required this.type,
        required this.width,
        required this.height,
        required this.url,
        required this.id,
    });

    int ?type;
    int? width;
    int? height;
    String ?url;
    String ?id;

    factory VideoVersion.fromJson(Map<String, dynamic> json) => VideoVersion(
        type: json["type"] == null ? null : json["type"],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
        url: json["url"] == null ? null : json["url"],
        id: json["id"] == null ? null : json["id"],
    );

    Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "width": width == null ? null : width,
        "height": height == null ? null : height,
        "url": url == null ? null : url,
        "id": id == null ? null : id,
    };
}

class ReelUser {
    ReelUser({
        required this.pk,
        required this.username,
        required this.isVerified,
        required this.friendshipStatus,
        required this.profilePicId,
        required this.profilePicUrl,
        required this.pkId,
        required this.isPrivate,
        required this.fullName,
    });

    String ?pk;
    String ?username;
    bool ?isVerified;
    FriendshipStatus ?friendshipStatus;
    String ?profilePicId;
    String ?profilePicUrl;
    String ?pkId;
    bool ?isPrivate;
    String ?fullName;

    factory ReelUser.fromJson(Map<String, dynamic> json) => ReelUser(
        pk: json["pk"] == null ? null : json["pk"],
        username: json["username"] == null ? null : json["username"],
        isVerified: json["is_verified"] == null ? null : json["is_verified"],
        friendshipStatus: json["friendship_status"] == null ? null : FriendshipStatus.fromJson(json["friendship_status"]),
        profilePicId: json["profile_pic_id"] == null ? null : json["profile_pic_id"],
        profilePicUrl: json["profile_pic_url"] == null ? null : json["profile_pic_url"],
        pkId: json["pk_id"] == null ? null : json["pk_id"],
        isPrivate: json["is_private"] == null ? null : json["is_private"],
        fullName: json["full_name"] == null ? null : json["full_name"],
    );

    Map<String, dynamic> toJson() => {
        "pk": pk == null ? null : pk,
        "username": username == null ? null : username,
        "is_verified": isVerified == null ? null : isVerified,
        "friendship_status": friendshipStatus == null ? null : friendshipStatus?.toJson(),
        "profile_pic_id": profilePicId == null ? null : profilePicId,
        "profile_pic_url": profilePicUrl == null ? null : profilePicUrl,
        "pk_id": pkId == null ? null : pkId,
        "is_private": isPrivate == null ? null : isPrivate,
        "full_name": fullName == null ? null : fullName,
    };
}

class FriendshipStatus {
    FriendshipStatus({
        required this.following,
        required this.followedBy,
        required this.blocking,
        required this.muting,
        required this.isPrivate,
        required this.incomingRequest,
        required this.outgoingRequest,
        required this.isBestie,
        required this.isRestricted,
        required this.isFeedFavorite,
    });

    bool ?following;
    bool ?followedBy;
    bool ?blocking;
    bool ?muting;
    bool? isPrivate;
    bool ?incomingRequest;
    bool ?outgoingRequest;
    bool? isBestie;
    bool ?isRestricted;
    bool ?isFeedFavorite;

    factory FriendshipStatus.fromJson(Map<String, dynamic> json) => FriendshipStatus(
        following: json["following"] == null ? null : json["following"],
        followedBy: json["followed_by"] == null ? null : json["followed_by"],
        blocking: json["blocking"] == null ? null : json["blocking"],
        muting: json["muting"] == null ? null : json["muting"],
        isPrivate: json["is_private"] == null ? null : json["is_private"],
        incomingRequest: json["incoming_request"] == null ? null : json["incoming_request"],
        outgoingRequest: json["outgoing_request"] == null ? null : json["outgoing_request"],
        isBestie: json["is_bestie"] == null ? null : json["is_bestie"],
        isRestricted: json["is_restricted"] == null ? null : json["is_restricted"],
        isFeedFavorite: json["is_feed_favorite"] == null ? null : json["is_feed_favorite"],
    );

    Map<String, dynamic> toJson() => {
        "following": following == null ? null : following,
        "followed_by": followedBy == null ? null : followedBy,
        "blocking": blocking == null ? null : blocking,
        "muting": muting == null ? null : muting,
        "is_private": isPrivate == null ? null : isPrivate,
        "incoming_request": incomingRequest == null ? null : incomingRequest,
        "outgoing_request": outgoingRequest == null ? null : outgoingRequest,
        "is_bestie": isBestie == null ? null : isBestie,
        "is_restricted": isRestricted == null ? null : isRestricted,
        "is_feed_favorite": isFeedFavorite == null ? null : isFeedFavorite,
    };
}

class EnumValues<T> {
    Map<String, T>? map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String>? get reverse {
        if (reverseMap == null) {
            reverseMap = map?.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
