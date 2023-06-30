
import 'dart:convert';

UserMedia userMediaFromJson(String str) => UserMedia.fromJson(json.decode(str));

String userMediaToJson(UserMedia data) => json.encode(data.toJson());

class UserMedia {
    UserMedia({
        required this.items,
        required this.numResults,
        required this.moreAvailable,
        required this.autoLoadMoreEnabled,
        required this.status,
    });

    List<Item>? items;
    int? numResults;
    bool? moreAvailable;
    bool? autoLoadMoreEnabled;
    String? status;

    factory UserMedia.fromJson(Map<String, dynamic> json) => UserMedia(
        items: json["items"] == null ? null : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        numResults: json["num_results"],
        moreAvailable: json["more_available"],
        autoLoadMoreEnabled: json["auto_load_more_enabled"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "items": items == null ? null : List<dynamic>.from(items!.map((x) => x.toJson())),
        "num_results": numResults,
        "more_available": moreAvailable,
        "auto_load_more_enabled": autoLoadMoreEnabled,
        "status": status,
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
        required this.commentLikesEnabled,
        required this.commentThreadingEnabled,
        required this.maxNumVisiblePreviewComments,
        required this.hasMoreComments,
        required this.previewComments,
        required this.commentCount,
        required this.canViewMorePreviewComments,
        required this.hideViewAllCommentEntrypoint,
        required this.inlineComposerDisplayCondition,
        required this.inlineComposerImpTriggerTime,
        required this.captionPosition,
        required this.isReelMedia,
        required this.photoOfYou,
        required this.isOrganicProductTaggingEligible,
        required this.canSeeInsightsAsBrand,
        required this.user,
        required this.likeCount,
        required this.hasLiked,
        required this.topLikers,
        required this.likers,
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
        required this.hasSharedToFb,
        required this.productType,
        required this.deletedReason,
        required this.integrityReviewDecision,
        required this.commerceIntegrityReviewDecision,
        required this.musicMetadata,
        required this.isArtistPick,
    });

    int? takenAt;
    String? pk;
    String? id;
    int? deviceTimestamp;
    int? mediaType;
    String? code;
    String? clientCacheKey;
    int? filterType;
    bool? isUnifiedVideo;
    bool? shouldRequestAds;
    bool? originalMediaHasVisualReplyMedia;
    bool? captionIsEdited;
    bool? likeAndViewCountsDisabled;
    String? commercialityStatus;
    bool? isPaidPartnership;
    bool? isVisualReplyCommenterNoticeEnabled;
    List<dynamic>? clipsTabPinnedUserIds;
    bool? hasDelayedMetadata;
    FundraiserTag? fundraiserTag;
    bool? commentLikesEnabled;
    bool? commentThreadingEnabled;
    int? maxNumVisiblePreviewComments;
    bool? hasMoreComments;
    List<dynamic>? previewComments;
    int? commentCount;
    bool? canViewMorePreviewComments;
    bool? hideViewAllCommentEntrypoint;
    String? inlineComposerDisplayCondition;
    int? inlineComposerImpTriggerTime;
    double? captionPosition;
    bool? isReelMedia;
    bool? photoOfYou;
    bool? isOrganicProductTaggingEligible;
    bool? canSeeInsightsAsBrand;
    ItemUser? user;
    int? likeCount;
    bool? hasLiked;
    List<dynamic>? topLikers;
    List<dynamic>? likers;
    ImageVersions2? imageVersions2;
    int? originalWidth;
    int? originalHeight;
    Caption? caption;
    CommentInformTreatment? commentInformTreatment;
    SharingFrictionInfo? sharingFrictionInfo;
    int? isDashEligible;
    String? videoDashManifest;
    String? videoCodec;
    int? numberOfQualities;
    List<VideoVersion>? videoVersions;
    bool? hasAudio;
    double? videoDuration;
    bool? canViewerSave;
    bool? isInProfileGrid;
    bool? profileGridControlEnabled;
    String? organicTrackingToken;
    int? expiringAt;
    int? importedTakenAt;
    int? hasSharedToFb;
    String? productType;
    int? deletedReason;
    String? integrityReviewDecision;
    dynamic commerceIntegrityReviewDecision;
    dynamic musicMetadata;
    bool? isArtistPick;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        takenAt: json["taken_at"],
        pk: json["pk"],
        id: json["id"],
        deviceTimestamp: json["device_timestamp"],
        mediaType: json["media_type"],
        code: json["code"],
        clientCacheKey: json["client_cache_key"],
        filterType: json["filter_type"],
        isUnifiedVideo: json["is_unified_video"],
        shouldRequestAds: json["should_request_ads"],
        originalMediaHasVisualReplyMedia: json["original_media_has_visual_reply_media"],
        captionIsEdited: json["caption_is_edited"],
        likeAndViewCountsDisabled: json["like_and_view_counts_disabled"],
        commercialityStatus: json["commerciality_status"],
        isPaidPartnership: json["is_paid_partnership"],
        isVisualReplyCommenterNoticeEnabled: json["is_visual_reply_commenter_notice_enabled"],
        clipsTabPinnedUserIds: json["clips_tab_pinned_user_ids"] == null ? null : List<dynamic>.from(json["clips_tab_pinned_user_ids"].map((x) => x)),
        hasDelayedMetadata: json["has_delayed_metadata"],
        fundraiserTag: json["fundraiser_tag"] == null ? null : FundraiserTag.fromJson(json["fundraiser_tag"]),
        commentLikesEnabled: json["comment_likes_enabled"],
        commentThreadingEnabled: json["comment_threading_enabled"],
        maxNumVisiblePreviewComments: json["max_num_visible_preview_comments"],
        hasMoreComments: json["has_more_comments"],
        previewComments: json["preview_comments"] == null ? null : List<dynamic>.from(json["preview_comments"].map((x) => x)),
        commentCount: json["comment_count"],
        canViewMorePreviewComments: json["can_view_more_preview_comments"],
        hideViewAllCommentEntrypoint: json["hide_view_all_comment_entrypoint"],
        inlineComposerDisplayCondition: json["inline_composer_display_condition"],
        inlineComposerImpTriggerTime: json["inline_composer_imp_trigger_time"],
        captionPosition: json["caption_position"],
        isReelMedia: json["is_reel_media"],
        photoOfYou: json["photo_of_you"],
        isOrganicProductTaggingEligible: json["is_organic_product_tagging_eligible"],
        canSeeInsightsAsBrand: json["can_see_insights_as_brand"],
        user: json["user"] == null ? null : ItemUser.fromJson(json["user"]),
        likeCount: json["like_count"],
        hasLiked: json["has_liked"],
        topLikers: json["top_likers"] == null ? null : List<dynamic>.from(json["top_likers"].map((x) => x)),
        likers: json["likers"] == null ? null : List<dynamic>.from(json["likers"].map((x) => x)),
        imageVersions2: json["image_versions2"] == null ? null : ImageVersions2.fromJson(json["image_versions2"]),
        originalWidth: json["original_width"],
        originalHeight: json["original_height"],
        caption: json["caption"] == null ? null : Caption.fromJson(json["caption"]),
        commentInformTreatment: json["comment_inform_treatment"] == null ? null : CommentInformTreatment.fromJson(json["comment_inform_treatment"]),
        sharingFrictionInfo: json["sharing_friction_info"] == null ? null : SharingFrictionInfo.fromJson(json["sharing_friction_info"]),
        isDashEligible: json["is_dash_eligible"],
        videoDashManifest: json["video_dash_manifest"],
        videoCodec: json["video_codec"],
        numberOfQualities: json["number_of_qualities"],
        videoVersions: json["video_versions"] == null ? null : List<VideoVersion>.from(json["video_versions"].map((x) => VideoVersion.fromJson(x))),
        hasAudio: json["has_audio"],
        videoDuration: json["video_duration"] == null ? null : json["video_duration"].toDouble(),
        canViewerSave: json["can_viewer_save"],
        isInProfileGrid: json["is_in_profile_grid"],
        profileGridControlEnabled: json["profile_grid_control_enabled"],
        organicTrackingToken: json["organic_tracking_token"],
        expiringAt: json["expiring_at"],
        importedTakenAt: json["imported_taken_at"],
        hasSharedToFb: json["has_shared_to_fb"],
        productType: json["product_type"],
        deletedReason: json["deleted_reason"],
        integrityReviewDecision: json["integrity_review_decision"],
        commerceIntegrityReviewDecision: json["commerce_integrity_review_decision"],
        musicMetadata: json["music_metadata"],
        isArtistPick: json["is_artist_pick"],
    );

    Map<String, dynamic> toJson() => {
        "taken_at": takenAt,
        "pk": pk,
        "id": id,
        "device_timestamp": deviceTimestamp,
        "media_type": mediaType,
        "code": code,
        "client_cache_key": clientCacheKey,
        "filter_type": filterType,
        "is_unified_video": isUnifiedVideo,
        "should_request_ads": shouldRequestAds,
        "original_media_has_visual_reply_media": originalMediaHasVisualReplyMedia,
        "caption_is_edited": captionIsEdited,
        "like_and_view_counts_disabled": likeAndViewCountsDisabled,
        "commerciality_status": commercialityStatus,
        "is_paid_partnership": isPaidPartnership,
        "is_visual_reply_commenter_notice_enabled": isVisualReplyCommenterNoticeEnabled,
        "clips_tab_pinned_user_ids": clipsTabPinnedUserIds == null ? null : List<dynamic>.from(clipsTabPinnedUserIds!.map((x) => x)),
        "has_delayed_metadata": hasDelayedMetadata,
        "fundraiser_tag": fundraiserTag == null ? null : fundraiserTag!.toJson(),
        "comment_likes_enabled": commentLikesEnabled,
        "comment_threading_enabled": commentThreadingEnabled,
        "max_num_visible_preview_comments": maxNumVisiblePreviewComments,
        "has_more_comments": hasMoreComments,
        "preview_comments": previewComments == null ? null : List<dynamic>.from(previewComments!.map((x) => x)),
        "comment_count": commentCount,
        "can_view_more_preview_comments": canViewMorePreviewComments,
        "hide_view_all_comment_entrypoint": hideViewAllCommentEntrypoint,
        "inline_composer_display_condition": inlineComposerDisplayCondition,
        "inline_composer_imp_trigger_time": inlineComposerImpTriggerTime,
        "caption_position": captionPosition,
        "is_reel_media": isReelMedia,
        "photo_of_you": photoOfYou,
        "is_organic_product_tagging_eligible": isOrganicProductTaggingEligible,
        "can_see_insights_as_brand": canSeeInsightsAsBrand,
        "user": user == null ? null : user!.toJson(),
        "like_count": likeCount,
        "has_liked": hasLiked,
        "top_likers": topLikers == null ? null : List<dynamic>.from(topLikers!.map((x) => x)),
        "likers": likers == null ? null : List<dynamic>.from(likers!.map((x) => x)),
        "image_versions2": imageVersions2 == null ? null : imageVersions2!.toJson(),
        "original_width": originalWidth,
        "original_height": originalHeight,
        "caption": caption == null ? null : caption!.toJson(),
        "comment_inform_treatment": commentInformTreatment == null ? null : commentInformTreatment!.toJson(),
        "sharing_friction_info": sharingFrictionInfo == null ? null : sharingFrictionInfo!.toJson(),
        "is_dash_eligible": isDashEligible,
        "video_dash_manifest": videoDashManifest,
        "video_codec": videoCodec,
        "number_of_qualities": numberOfQualities,
        "video_versions": videoVersions == null ? null : List<dynamic>.from(videoVersions!.map((x) => x.toJson())),
        "has_audio": hasAudio,
        "video_duration": videoDuration,
        "can_viewer_save": canViewerSave,
        "is_in_profile_grid": isInProfileGrid,
        "profile_grid_control_enabled": profileGridControlEnabled,
        "organic_tracking_token": organicTrackingToken,
        "expiring_at": expiringAt,
        "imported_taken_at": importedTakenAt,
        "has_shared_to_fb": hasSharedToFb,
        "product_type": productType,
        "deleted_reason": deletedReason,
        "integrity_review_decision": integrityReviewDecision,
        "commerce_integrity_review_decision": commerceIntegrityReviewDecision,
        "music_metadata": musicMetadata,
        "is_artist_pick": isArtistPick,
    };
}

class Caption {
    Caption({
        required this.pk,
        required this.userId,
        required this.text,
        required this.type,
        required this.createdAt,
        required this.createdAtUtc,
        required this.contentType,
        required this.status,
        required this.bitFlags,
        required this.didReportAsSpam,
        required this.shareEnabled,
        required this.user,
        required this.isCovered,
        required this.isRankedComment,
        required this.mediaId,
        required this.privateReplyStatus,
    });

    String? pk;
    String? userId;
    String? text;
    int? type;
    int? createdAt;
    int? createdAtUtc;
    String? contentType;
    String? status;
    int? bitFlags;
    bool? didReportAsSpam;
    bool? shareEnabled;
    CaptionUser? user;
    bool? isCovered;
    bool? isRankedComment;
    String? mediaId;
    int? privateReplyStatus;

    factory Caption.fromJson(Map<String, dynamic> json) => Caption(
        pk: json["pk"],
        userId: json["user_id"],
        text: json["text"],
        type: json["type"],
        createdAt: json["created_at"],
        createdAtUtc: json["created_at_utc"],
        contentType: json["content_type"],
        status: json["status"],
        bitFlags: json["bit_flags"],
        didReportAsSpam: json["did_report_as_spam"],
        shareEnabled: json["share_enabled"],
        user: json["user"] == null ? null : CaptionUser.fromJson(json["user"]),
        isCovered: json["is_covered"],
        isRankedComment: json["is_ranked_comment"],
        mediaId: json["media_id"],
        privateReplyStatus: json["private_reply_status"],
    );

    Map<String, dynamic> toJson() => {
        "pk": pk,
        "user_id": userId,
        "text": text,
        "type": type,
        "created_at": createdAt,
        "created_at_utc": createdAtUtc,
        "content_type": contentType,
        "status": status,
        "bit_flags": bitFlags,
        "did_report_as_spam": didReportAsSpam,
        "share_enabled": shareEnabled,
        "user": user == null ? null : user!.toJson(),
        "is_covered": isCovered,
        "is_ranked_comment": isRankedComment,
        "media_id": mediaId,
        "private_reply_status": privateReplyStatus,
    };
}

class CaptionUser {
    CaptionUser({
        required this.pk,
        required this.username,
        required this.fullName,
        required this.isPrivate,
        required this.pkId,
        required this.profilePicUrl,
        required this.profilePicId,
        required this.isVerified,
    });

    String? pk;
    String? username;
    String? fullName;
    bool? isPrivate;
    String? pkId;
    String? profilePicUrl;
    String? profilePicId;
    bool? isVerified;

    factory CaptionUser.fromJson(Map<String, dynamic> json) => CaptionUser(
        pk: json["pk"],
        username: json["username"],
        fullName: json["full_name"],
        isPrivate: json["is_private"],
        pkId: json["pk_id"],
        profilePicUrl: json["profile_pic_url"],
        profilePicId: json["profile_pic_id"],
        isVerified: json["is_verified"],
    );

    Map<String, dynamic> toJson() => {
        "pk": pk,
        "username": username,
        "full_name": fullName,
        "is_private": isPrivate,
        "pk_id": pkId,
        "profile_pic_url": profilePicUrl,
        "profile_pic_id": profilePicId,
        "is_verified": isVerified,
    };
}

class CommentInformTreatment {
    CommentInformTreatment({
        required this.shouldHaveInformTreatment,
        required this.text,
        required this.url,
        required this.actionType,
    });

    bool? shouldHaveInformTreatment;
    String? text;
    dynamic url;
    dynamic actionType;

    factory CommentInformTreatment.fromJson(Map<String, dynamic> json) => CommentInformTreatment(
        shouldHaveInformTreatment: json["should_have_inform_treatment"],
        text: json["text"],
        url: json["url"],
        actionType: json["action_type"],
    );

    Map<String, dynamic> toJson() => {
        "should_have_inform_treatment": shouldHaveInformTreatment,
        "text": text,
        "url": url,
        "action_type": actionType,
    };
}

class FundraiserTag {
    FundraiserTag({
        required this.hasStandaloneFundraiser,
    });

    bool? hasStandaloneFundraiser;

    factory FundraiserTag.fromJson(Map<String, dynamic> json) => FundraiserTag(
        hasStandaloneFundraiser: json["has_standalone_fundraiser"],
    );

    Map<String, dynamic> toJson() => {
        "has_standalone_fundraiser": hasStandaloneFundraiser,
    };
}

class ImageVersions2 {
    ImageVersions2({
        required this.candidates,
    });

    List<Candidate>? candidates;

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

    int? width;
    int? height;
    String? url;
    ScansProfile? scansProfile;

    factory Candidate.fromJson(Map<String, dynamic> json) => Candidate(
        width: json["width"],
        height: json["height"],
        url: json["url"],
        scansProfile: json["scans_profile"] == null ? null : scansProfileValues.map![json["scans_profile"]],
    );

    Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "url": url,
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

    bool? shouldHaveSharingFriction;
    dynamic bloksAppUrl;
    dynamic sharingFrictionPayload;

    factory SharingFrictionInfo.fromJson(Map<String, dynamic> json) => SharingFrictionInfo(
        shouldHaveSharingFriction: json["should_have_sharing_friction"],
        bloksAppUrl: json["bloks_app_url"],
        sharingFrictionPayload: json["sharing_friction_payload"],
    );

    Map<String, dynamic> toJson() => {
        "should_have_sharing_friction": shouldHaveSharingFriction,
        "bloks_app_url": bloksAppUrl,
        "sharing_friction_payload": sharingFrictionPayload,
    };
}

class ItemUser {
    ItemUser({
        required this.pk,
        required this.username,
        required this.fullName,
        required this.isPrivate,
        required this.pkId,
        required this.profilePicUrl,
        required this.profilePicId,
        required this.friendshipStatus,
        required this.isVerified,
        required this.hasAnonymousProfilePicture,
        required this.isUnpublished,
        required this.isFavorite,
        required this.latestReelMedia,
        required this.hasHighlightReels,
        required this.transparencyProductEnabled,
        required this.accountBadges,
        required this.fanClubInfo,
    });

    String? pk;
    String? username;
    String? fullName;
    bool? isPrivate;
    String? pkId;
    String? profilePicUrl;
    String? profilePicId;
    FriendshipStatus? friendshipStatus;
    bool? isVerified;
    bool? hasAnonymousProfilePicture;
    bool? isUnpublished;
    bool? isFavorite;
    int? latestReelMedia;
    bool? hasHighlightReels;
    bool? transparencyProductEnabled;
    List<dynamic>? accountBadges;
    FanClubInfo? fanClubInfo;

    factory ItemUser.fromJson(Map<String, dynamic> json) => ItemUser(
        pk: json["pk"],
        username: json["username"],
        fullName: json["full_name"],
        isPrivate: json["is_private"],
        pkId: json["pk_id"],
        profilePicUrl: json["profile_pic_url"],
        profilePicId: json["profile_pic_id"],
        friendshipStatus: json["friendship_status"] == null ? null : FriendshipStatus.fromJson(json["friendship_status"]),
        isVerified: json["is_verified"],
        hasAnonymousProfilePicture: json["has_anonymous_profile_picture"],
        isUnpublished: json["is_unpublished"],
        isFavorite: json["is_favorite"],
        latestReelMedia: json["latest_reel_media"],
        hasHighlightReels: json["has_highlight_reels"],
        transparencyProductEnabled: json["transparency_product_enabled"],
        accountBadges: json["account_badges"] == null ? null : List<dynamic>.from(json["account_badges"].map((x) => x)),
        fanClubInfo: json["fan_club_info"] == null ? null : FanClubInfo.fromJson(json["fan_club_info"]),
    );

    Map<String, dynamic> toJson() => {
        "pk": pk,
        "username": username,
        "full_name": fullName,
        "is_private": isPrivate,
        "pk_id": pkId,
        "profile_pic_url": profilePicUrl,
        "profile_pic_id": profilePicId,
        "friendship_status": friendshipStatus == null ? null : friendshipStatus!.toJson(),
        "is_verified": isVerified,
        "has_anonymous_profile_picture": hasAnonymousProfilePicture,
        "is_unpublished": isUnpublished,
        "is_favorite": isFavorite,
        "latest_reel_media": latestReelMedia,
        "has_highlight_reels": hasHighlightReels,
        "transparency_product_enabled": transparencyProductEnabled,
        "account_badges": accountBadges == null ? null : List<dynamic>.from(accountBadges!.map((x) => x)),
        "fan_club_info": fanClubInfo == null ? null : fanClubInfo!.toJson(),
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

class FriendshipStatus {
    FriendshipStatus({
        required this.following,
        required this.outgoingRequest,
        required this.isBestie,
        required this.isRestricted,
        required this.isFeedFavorite,
    });

    bool? following;
    bool? outgoingRequest;
    bool? isBestie;
    bool? isRestricted;
    bool? isFeedFavorite;

    factory FriendshipStatus.fromJson(Map<String, dynamic> json) => FriendshipStatus(
        following: json["following"],
        outgoingRequest: json["outgoing_request"],
        isBestie: json["is_bestie"],
        isRestricted: json["is_restricted"],
        isFeedFavorite: json["is_feed_favorite"],
    );

    Map<String, dynamic> toJson() => {
        "following": following,
        "outgoing_request": outgoingRequest,
        "is_bestie": isBestie,
        "is_restricted": isRestricted,
        "is_feed_favorite": isFeedFavorite,
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
    int ?width;
    int ?height;
    String ?url;
    String ?id;

    factory VideoVersion.fromJson(Map<String, dynamic> json) => VideoVersion(
        type: json["type"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "width": width,
        "height": height,
        "url": url,
        "id": id,
    };
}

class EnumValues<T> {
    Map<String, T>? map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String>? get reverse {
        reverseMap ??= map!.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
