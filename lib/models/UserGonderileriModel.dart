
import 'dart:convert';

UserGonderileri userGonderileriFromJson(String str) => UserGonderileri.fromJson(json.decode(str));

String userGonderileriToJson(UserGonderileri data) => json.encode(data.toJson());

class UserGonderileri {
    UserGonderileri({
        required this.items,
        required this.numResults,
        required this.moreAvailable,
        required this.user,
        required this.autoLoadMoreEnabled,
        required this.status,
    });

    List<Item> ?items;
    int ?numResults;
    bool ?moreAvailable;
    UserElement ?user;
    bool? autoLoadMoreEnabled;
    String ?status;

    factory UserGonderileri.fromJson(Map<String, dynamic> json) => UserGonderileri(
        items: json["items"] == null ? null : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        numResults: json["num_results"],
        moreAvailable: json["more_available"],
        user: json["user"] == null ? null : UserElement.fromJson(json["user"]),
        autoLoadMoreEnabled: json["auto_load_more_enabled"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "items": items == null ? null : List<dynamic>.from(items!.map((x) => x.toJson())),
        "num_results": numResults,
        "more_available": moreAvailable,
        "user": user == null ? null : user!.toJson(),
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
        required this.carouselMediaCount,
        required this.carouselMedia,
        required this.canSeeInsightsAsBrand,
        required this.photoOfYou,
        required this.isOrganicProductTaggingEligible,
        required this.user,
        required this.canViewerReshare,
        required this.likeCount,
        required this.hasLiked,
        required this.topLikers,
        required this.likers,
        required this.caption,
        required this.commentInformTreatment,
        required this.sharingFrictionInfo,
        required this.canViewerSave,
        required this.isInProfileGrid,
        required this.profileGridControlEnabled,
        required this.organicTrackingToken,
        required this.hasSharedToFb,
        required this.productType,
        required this.deletedReason,
        required this.integrityReviewDecision,
        required this.commerceIntegrityReviewDecision,
        required this.musicMetadata,
        required this.isArtistPick,
        required this.imageVersions2,
        required this.originalWidth,
        required this.originalHeight,
        required this.videoVersions,
        required this.hasAudio,
        required this.videoDuration,
        required this.viewCount,
        required this.playCount,
        required this.clipsMetadata,
        required this.mediaCroppingInfo,
    });

    int ?takenAt;
    String ?pk;
    String? id;
    int? deviceTimestamp;
    int? mediaType;
    String? code;
    String? clientCacheKey;
    int? filterType;
    bool ?isUnifiedVideo;
    bool ?shouldRequestAds;
    bool ?originalMediaHasVisualReplyMedia;
    bool ?captionIsEdited;
    bool ?likeAndViewCountsDisabled;
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
    bool ?canViewMorePreviewComments;
    bool ?hideViewAllCommentEntrypoint;
    String ?inlineComposerDisplayCondition;
    int? inlineComposerImpTriggerTime;
    int ?carouselMediaCount;
    List<CarouselMedia>? carouselMedia;
    bool? canSeeInsightsAsBrand;
    bool? photoOfYou;
    bool? isOrganicProductTaggingEligible;
    PurpleUser ?user;
    bool? canViewerReshare;
    int ?likeCount;
    bool? hasLiked;
    List<dynamic> ?topLikers;
    List<UserElement>? likers;
    Caption ?caption;
    CommentInformTreatment? commentInformTreatment;
    SharingFrictionInfo ?sharingFrictionInfo;
    bool? canViewerSave;
    bool? isInProfileGrid;
    bool ?profileGridControlEnabled;
    String ?organicTrackingToken;
    int ?hasSharedToFb;
    String ?productType;
    int ?deletedReason;
    String ?integrityReviewDecision;
    dynamic commerceIntegrityReviewDecision;
    dynamic musicMetadata;
    bool ?isArtistPick;
    ItemImageVersions2 ?imageVersions2;
    int ?originalWidth;
    int ?originalHeight;
    List<VideoVersion>? videoVersions;
    bool ?hasAudio;
    double? videoDuration;
    int ?viewCount;
    int ?playCount;
    ClipsMetadata ?clipsMetadata;
    MediaCroppingInfo ?mediaCroppingInfo;

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
        carouselMediaCount: json["carousel_media_count"],
        carouselMedia: json["carousel_media"] == null ? null : List<CarouselMedia>.from(json["carousel_media"].map((x) => CarouselMedia.fromJson(x))),
        canSeeInsightsAsBrand: json["can_see_insights_as_brand"],
        photoOfYou: json["photo_of_you"],
        isOrganicProductTaggingEligible: json["is_organic_product_tagging_eligible"],
        user: json["user"] == null ? null : PurpleUser.fromJson(json["user"]),
        canViewerReshare: json["can_viewer_reshare"],
        likeCount: json["like_count"],
        hasLiked: json["has_liked"],
        topLikers: json["top_likers"] == null ? null : List<dynamic>.from(json["top_likers"].map((x) => x)),
        likers: json["likers"] == null ? null : List<UserElement>.from(json["likers"].map((x) => UserElement.fromJson(x))),
        caption: json["caption"] == null ? null : Caption.fromJson(json["caption"]),
        commentInformTreatment: json["comment_inform_treatment"] == null ? null : CommentInformTreatment.fromJson(json["comment_inform_treatment"]),
        sharingFrictionInfo: json["sharing_friction_info"] == null ? null : SharingFrictionInfo.fromJson(json["sharing_friction_info"]),
        canViewerSave: json["can_viewer_save"],
        isInProfileGrid: json["is_in_profile_grid"],
        profileGridControlEnabled: json["profile_grid_control_enabled"],
        organicTrackingToken: json["organic_tracking_token"],
        hasSharedToFb: json["has_shared_to_fb"],
        productType: json["product_type"],
        deletedReason: json["deleted_reason"],
        integrityReviewDecision: json["integrity_review_decision"],
        commerceIntegrityReviewDecision: json["commerce_integrity_review_decision"],
        musicMetadata: json["music_metadata"],
        isArtistPick: json["is_artist_pick"],
        imageVersions2: json["image_versions2"] == null ? null : ItemImageVersions2.fromJson(json["image_versions2"]),
        originalWidth: json["original_width"],
        originalHeight: json["original_height"],
        videoVersions: json["video_versions"] == null ? null : List<VideoVersion>.from(json["video_versions"].map((x) => VideoVersion.fromJson(x))),
        hasAudio: json["has_audio"],
        videoDuration: json["video_duration"] == null ? null : json["video_duration"].toDouble(),
        viewCount: json["view_count"],
        playCount: json["play_count"],
        clipsMetadata: json["clips_metadata"] == null ? null : ClipsMetadata.fromJson(json["clips_metadata"]),
        mediaCroppingInfo: json["media_cropping_info"] == null ? null : MediaCroppingInfo.fromJson(json["media_cropping_info"]),
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
        "carousel_media_count": carouselMediaCount,
        "carousel_media": carouselMedia == null ? null : List<dynamic>.from(carouselMedia!.map((x) => x.toJson())),
        "can_see_insights_as_brand": canSeeInsightsAsBrand,
        "photo_of_you": photoOfYou,
        "is_organic_product_tagging_eligible": isOrganicProductTaggingEligible,
        "user": user == null ? null : user!.toJson(),
        "can_viewer_reshare": canViewerReshare,
        "like_count": likeCount,
        "has_liked": hasLiked,
        "top_likers": topLikers == null ? null : List<dynamic>.from(topLikers!.map((x) => x)),
        "likers": likers == null ? null : List<dynamic>.from(likers!.map((x) => x.toJson())),
        "caption": caption == null ? null : caption!.toJson(),
        "comment_inform_treatment": commentInformTreatment == null ? null : commentInformTreatment!.toJson(),
        "sharing_friction_info": sharingFrictionInfo == null ? null : sharingFrictionInfo!.toJson(),
        "can_viewer_save": canViewerSave,
        "is_in_profile_grid": isInProfileGrid,
        "profile_grid_control_enabled": profileGridControlEnabled,
        "organic_tracking_token": organicTrackingToken,
        "has_shared_to_fb": hasSharedToFb,
        "product_type": productType,
        "deleted_reason": deletedReason,
        "integrity_review_decision": integrityReviewDecision,
        "commerce_integrity_review_decision": commerceIntegrityReviewDecision,
        "music_metadata": musicMetadata,
        "is_artist_pick": isArtistPick,
        "image_versions2": imageVersions2 == null ? null : imageVersions2!.toJson(),
        "original_width": originalWidth,
        "original_height": originalHeight,
        "video_versions": videoVersions == null ? null : List<dynamic>.from(videoVersions!.map((x) => x.toJson())),
        "has_audio": hasAudio,
        "video_duration": videoDuration,
        "view_count": viewCount,
        "play_count": playCount,
        "clips_metadata": clipsMetadata == null ? null : clipsMetadata!.toJson(),
        "media_cropping_info": mediaCroppingInfo == null ? null : mediaCroppingInfo?.toJson(),
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
    int ?type;
    int ?createdAt;
    int ?createdAtUtc;
    String ?contentType;
    String? status;
    int ?bitFlags;
    bool ?didReportAsSpam;
    bool ?shareEnabled;
    UserElement? user;
    bool ?isCovered;
    bool ?isRankedComment;
    String ?mediaId;
    int ?privateReplyStatus;

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
        user: json["user"] == null ? null : UserElement.fromJson(json["user"]),
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

class UserElement {
    UserElement({
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
    String ?username;
    String? fullName;
    bool? isPrivate;
    String ?pkId;
    String? profilePicUrl;
    String? profilePicId;
    bool? isVerified;

    factory UserElement.fromJson(Map<String, dynamic> json) => UserElement(
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

class CarouselMedia {
    CarouselMedia({
        required this.id,
        required this.mediaType,
        required this.imageVersions2,
        required this.originalWidth,
        required this.originalHeight,
        required this.videoVersions,
        required this.videoDuration,
        required this.pk,
        required this.carouselParentId,
        required this.commercialityStatus,
        required this.sharingFrictionInfo,
    });

    String ?id;
    int ?mediaType;
    CarouselMediaImageVersions2 ?imageVersions2;
    int? originalWidth;
    int? originalHeight;
    List<VideoVersion>? videoVersions;
    double? videoDuration;
    String? pk;
    String? carouselParentId;
    String? commercialityStatus;
    SharingFrictionInfo? sharingFrictionInfo;

    factory CarouselMedia.fromJson(Map<String, dynamic> json) => CarouselMedia(
        id: json["id"],
        mediaType: json["media_type"],
        imageVersions2: json["image_versions2"] == null ? null : CarouselMediaImageVersions2.fromJson(json["image_versions2"]),
        originalWidth: json["original_width"],
        originalHeight: json["original_height"],
        videoVersions: json["video_versions"] == null ? null : List<VideoVersion>.from(json["video_versions"].map((x) => VideoVersion.fromJson(x))),
        videoDuration: json["video_duration"] == null ? null : json["video_duration"].toDouble(),
        pk: json["pk"],
        carouselParentId: json["carousel_parent_id"],
        commercialityStatus: json["commerciality_status"],
        sharingFrictionInfo: json["sharing_friction_info"] == null ? null : SharingFrictionInfo.fromJson(json["sharing_friction_info"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "media_type": mediaType,
        "image_versions2": imageVersions2 == null ? null : imageVersions2!.toJson(),
        "original_width": originalWidth,
        "original_height": originalHeight,
        "video_versions": videoVersions == null ? null : List<dynamic>.from(videoVersions!.map((x) => x.toJson())),
        "video_duration": videoDuration,
        "pk": pk,
        "carousel_parent_id": carouselParentId,
        "commerciality_status": commercialityStatus,
        "sharing_friction_info": sharingFrictionInfo == null ? null : sharingFrictionInfo?.toJson(),
    };
}

class CarouselMediaImageVersions2 {
    CarouselMediaImageVersions2({
        required this.candidates,
    });

    List<Candidate> ?candidates;

    factory CarouselMediaImageVersions2.fromJson(Map<String, dynamic> json) => CarouselMediaImageVersions2(
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
        required this.estimatedScansSizes,
    });

    int ?width;
    int ?height;
    String ?url;
    ScansProfile ?scansProfile;
    List<int> ?estimatedScansSizes;

    factory Candidate.fromJson(Map<String, dynamic> json) => Candidate(
        width: json["width"],
        height: json["height"],
        url: json["url"],
        scansProfile: json["scans_profile"] == null ? null : scansProfileValues.map![json["scans_profile"]],
        estimatedScansSizes: json["estimated_scans_sizes"] == null ? null : List<int>.from(json["estimated_scans_sizes"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "url": url,
        "scans_profile": scansProfile == null ? null : scansProfileValues.reverse![scansProfile],
        "estimated_scans_sizes": estimatedScansSizes == null ? null : List<dynamic>.from(estimatedScansSizes!.map((x) => x)),
    };
}

enum ScansProfile { E15, E35 }

final scansProfileValues = EnumValues({
    "e15": ScansProfile.E15,
    "e35": ScansProfile.E35
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

class ClipsMetadata {
    ClipsMetadata({
        required this.musicInfo,
        required this.originalSoundInfo,
        required this.audioType,
        required this.musicCanonicalId,
        required this.featuredLabel,
        required this.mashupInfo,
        required this.nuxInfo,
        required this.viewerInteractionSettings,
        required this.brandedContentTagInfo,
        required this.shoppingInfo,
        required this.additionalAudioInfo,
        required this.isSharedToFb,
        required this.breakingContentInfo,
        required this.challengeInfo,
        required this.reelsOnTheRiseInfo,
        required this.breakingCreatorInfo,
        required this.assetRecommendationInfo,
        required this.contextualHighlightInfo,
        required this.clipsCreationEntryPoint,
        required this.audioRankingInfo,
        required this.templateInfo,
        required this.isFanClubPromoVideo,
        required this.disableUseInClipsClientCache,
        required this.contentAppreciationInfo,
        required this.achievementsInfo,
        required this.showAchievements,
        required this.showTips,
        required this.merchandisingPillInfo,
        required this.isPublicChatWelcomeVideo,
        required this.professionalClipsUpsellType,
    });

    dynamic musicInfo;
    dynamic originalSoundInfo;
    String ?audioType;
    String ?musicCanonicalId;
    dynamic featuredLabel;
    MashupInfo ?mashupInfo;
    dynamic nuxInfo;
    dynamic viewerInteractionSettings;
    BrandedContentTagInfo? brandedContentTagInfo;
    dynamic shoppingInfo;
    AdditionalAudioInfo ?additionalAudioInfo;
    bool ?isSharedToFb;
    dynamic breakingContentInfo;
    dynamic challengeInfo;
    dynamic reelsOnTheRiseInfo;
    dynamic breakingCreatorInfo;
    dynamic assetRecommendationInfo;
    dynamic contextualHighlightInfo;
    String ?clipsCreationEntryPoint;
    AudioRankingInfo ?audioRankingInfo;
    dynamic templateInfo;
    dynamic isFanClubPromoVideo;
    bool ?disableUseInClipsClientCache;
    dynamic contentAppreciationInfo;
    AchievementsInfo ?achievementsInfo;
    bool ?showAchievements;
    bool ?showTips;
    dynamic merchandisingPillInfo;
    bool ?isPublicChatWelcomeVideo;
    int ?professionalClipsUpsellType;

    factory ClipsMetadata.fromJson(Map<String, dynamic> json) => ClipsMetadata(
        musicInfo: json["music_info"],
        originalSoundInfo: json["original_sound_info"],
        audioType: json["audio_type"],
        musicCanonicalId: json["music_canonical_id"],
        featuredLabel: json["featured_label"],
        mashupInfo: json["mashup_info"] == null ? null : MashupInfo.fromJson(json["mashup_info"]),
        nuxInfo: json["nux_info"],
        viewerInteractionSettings: json["viewer_interaction_settings"],
        brandedContentTagInfo: json["branded_content_tag_info"] == null ? null : BrandedContentTagInfo.fromJson(json["branded_content_tag_info"]),
        shoppingInfo: json["shopping_info"],
        additionalAudioInfo: json["additional_audio_info"] == null ? null : AdditionalAudioInfo.fromJson(json["additional_audio_info"]),
        isSharedToFb: json["is_shared_to_fb"],
        breakingContentInfo: json["breaking_content_info"],
        challengeInfo: json["challenge_info"],
        reelsOnTheRiseInfo: json["reels_on_the_rise_info"],
        breakingCreatorInfo: json["breaking_creator_info"],
        assetRecommendationInfo: json["asset_recommendation_info"],
        contextualHighlightInfo: json["contextual_highlight_info"],
        clipsCreationEntryPoint: json["clips_creation_entry_point"],
        audioRankingInfo: json["audio_ranking_info"] == null ? null : AudioRankingInfo.fromJson(json["audio_ranking_info"]),
        templateInfo: json["template_info"],
        isFanClubPromoVideo: json["is_fan_club_promo_video"],
        disableUseInClipsClientCache: json["disable_use_in_clips_client_cache"],
        contentAppreciationInfo: json["content_appreciation_info"],
        achievementsInfo: json["achievements_info"] == null ? null : AchievementsInfo.fromJson(json["achievements_info"]),
        showAchievements: json["show_achievements"],
        showTips: json["show_tips"],
        merchandisingPillInfo: json["merchandising_pill_info"],
        isPublicChatWelcomeVideo: json["is_public_chat_welcome_video"],
        professionalClipsUpsellType: json["professional_clips_upsell_type"],
    );

    Map<String, dynamic> toJson() => {
        "music_info": musicInfo,
        "original_sound_info": originalSoundInfo,
        "audio_type": audioType,
        "music_canonical_id": musicCanonicalId,
        "featured_label": featuredLabel,
        "mashup_info": mashupInfo == null ? null : mashupInfo!.toJson(),
        "nux_info": nuxInfo,
        "viewer_interaction_settings": viewerInteractionSettings,
        "branded_content_tag_info": brandedContentTagInfo == null ? null : brandedContentTagInfo!.toJson(),
        "shopping_info": shoppingInfo,
        "additional_audio_info": additionalAudioInfo == null ? null : additionalAudioInfo!.toJson(),
        "is_shared_to_fb": isSharedToFb,
        "breaking_content_info": breakingContentInfo,
        "challenge_info": challengeInfo,
        "reels_on_the_rise_info": reelsOnTheRiseInfo,
        "breaking_creator_info": breakingCreatorInfo,
        "asset_recommendation_info": assetRecommendationInfo,
        "contextual_highlight_info": contextualHighlightInfo,
        "clips_creation_entry_point": clipsCreationEntryPoint,
        "audio_ranking_info": audioRankingInfo == null ? null : audioRankingInfo!.toJson(),
        "template_info": templateInfo,
        "is_fan_club_promo_video": isFanClubPromoVideo,
        "disable_use_in_clips_client_cache": disableUseInClipsClientCache,
        "content_appreciation_info": contentAppreciationInfo,
        "achievements_info": achievementsInfo == null ? null : achievementsInfo!.toJson(),
        "show_achievements": showAchievements,
        "show_tips": showTips,
        "merchandising_pill_info": merchandisingPillInfo,
        "is_public_chat_welcome_video": isPublicChatWelcomeVideo,
        "professional_clips_upsell_type": professionalClipsUpsellType,
    };
}

class AchievementsInfo {
    AchievementsInfo({
        required this.showAchievements,
        required this.numEarnedAchievements,
    });

    bool ?showAchievements;
    dynamic numEarnedAchievements;

    factory AchievementsInfo.fromJson(Map<String, dynamic> json) => AchievementsInfo(
        showAchievements: json["show_achievements"],
        numEarnedAchievements: json["num_earned_achievements"],
    );

    Map<String, dynamic> toJson() => {
        "show_achievements": showAchievements,
        "num_earned_achievements": numEarnedAchievements,
    };
}

class AdditionalAudioInfo {
    AdditionalAudioInfo({
        required this.additionalAudioUsername,
        required this.audioReattributionInfo,
    });

    dynamic additionalAudioUsername;
    AudioReattributionInfo ?audioReattributionInfo;

    factory AdditionalAudioInfo.fromJson(Map<String, dynamic> json) => AdditionalAudioInfo(
        additionalAudioUsername: json["additional_audio_username"],
        audioReattributionInfo: json["audio_reattribution_info"] == null ? null : AudioReattributionInfo.fromJson(json["audio_reattribution_info"]),
    );

    Map<String, dynamic> toJson() => {
        "additional_audio_username": additionalAudioUsername,
        "audio_reattribution_info": audioReattributionInfo == null ? null : audioReattributionInfo?.toJson(),
    };
}

class AudioReattributionInfo {
    AudioReattributionInfo({
        required this.shouldAllowRestore,
    });

    bool ?shouldAllowRestore;

    factory AudioReattributionInfo.fromJson(Map<String, dynamic> json) => AudioReattributionInfo(
        shouldAllowRestore: json["should_allow_restore"],
    );

    Map<String, dynamic> toJson() => {
        "should_allow_restore": shouldAllowRestore,
    };
}

class AudioRankingInfo {
    AudioRankingInfo({
        required this.bestAudioClusterId,
    });

    String ?bestAudioClusterId;

    factory AudioRankingInfo.fromJson(Map<String, dynamic> json) => AudioRankingInfo(
        bestAudioClusterId: json["best_audio_cluster_id"],
    );

    Map<String, dynamic> toJson() => {
        "best_audio_cluster_id": bestAudioClusterId,
    };
}

class BrandedContentTagInfo {
    BrandedContentTagInfo({
        required this.canAddTag,
    });

    bool ?canAddTag;

    factory BrandedContentTagInfo.fromJson(Map<String, dynamic> json) => BrandedContentTagInfo(
        canAddTag: json["can_add_tag"],
    );

    Map<String, dynamic> toJson() => {
        "can_add_tag": canAddTag,
    };
}

class MashupInfo {
    MashupInfo({
        required this.mashupsAllowed,
        required this.canToggleMashupsAllowed,
        required this.hasBeenMashedUp,
        required this.formattedMashupsCount,
        required this.originalMedia,
        required this.privacyFilteredMashupsMediaCount,
        required this.nonPrivacyFilteredMashupsMediaCount,
        required this.mashupType,
        required this.isCreatorRequestingMashup,
        required this.hasNonmimicableAdditionalAudio,
    });

    bool ?mashupsAllowed;
    bool ?canToggleMashupsAllowed;
    bool ?hasBeenMashedUp;
    dynamic formattedMashupsCount;
    dynamic originalMedia;
    dynamic privacyFilteredMashupsMediaCount;
    dynamic nonPrivacyFilteredMashupsMediaCount;
    dynamic mashupType;
    bool? isCreatorRequestingMashup;
    bool? hasNonmimicableAdditionalAudio;

    factory MashupInfo.fromJson(Map<String, dynamic> json) => MashupInfo(
        mashupsAllowed: json["mashups_allowed"],
        canToggleMashupsAllowed: json["can_toggle_mashups_allowed"],
        hasBeenMashedUp: json["has_been_mashed_up"],
        formattedMashupsCount: json["formatted_mashups_count"],
        originalMedia: json["original_media"],
        privacyFilteredMashupsMediaCount: json["privacy_filtered_mashups_media_count"],
        nonPrivacyFilteredMashupsMediaCount: json["non_privacy_filtered_mashups_media_count"],
        mashupType: json["mashup_type"],
        isCreatorRequestingMashup: json["is_creator_requesting_mashup"],
        hasNonmimicableAdditionalAudio: json["has_nonmimicable_additional_audio"],
    );

    Map<String, dynamic> toJson() => {
        "mashups_allowed": mashupsAllowed,
        "can_toggle_mashups_allowed": canToggleMashupsAllowed,
        "has_been_mashed_up": hasBeenMashedUp,
        "formatted_mashups_count": formattedMashupsCount,
        "original_media": originalMedia,
        "privacy_filtered_mashups_media_count": privacyFilteredMashupsMediaCount,
        "non_privacy_filtered_mashups_media_count": nonPrivacyFilteredMashupsMediaCount,
        "mashup_type": mashupType,
        "is_creator_requesting_mashup": isCreatorRequestingMashup,
        "has_nonmimicable_additional_audio": hasNonmimicableAdditionalAudio,
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
    String ?text;
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

    bool ?hasStandaloneFundraiser;

    factory FundraiserTag.fromJson(Map<String, dynamic> json) => FundraiserTag(
        hasStandaloneFundraiser: json["has_standalone_fundraiser"],
    );

    Map<String, dynamic> toJson() => {
        "has_standalone_fundraiser": hasStandaloneFundraiser,
    };
}

class ItemImageVersions2 {
    ItemImageVersions2({
        required this.candidates,
        required this.additionalCandidates,
        required this.smartThumbnailEnabled,
    });

    List<Candidate> ?candidates;
    AdditionalCandidates ?additionalCandidates;
    bool ?smartThumbnailEnabled;

    factory ItemImageVersions2.fromJson(Map<String, dynamic> json) => ItemImageVersions2(
        candidates: json["candidates"] == null ? null : List<Candidate>.from(json["candidates"].map((x) => Candidate.fromJson(x))),
        additionalCandidates: json["additional_candidates"] == null ? null : AdditionalCandidates.fromJson(json["additional_candidates"]),
        smartThumbnailEnabled: json["smart_thumbnail_enabled"],
    );

    Map<String, dynamic> toJson() => {
        "candidates": candidates == null ? null : List<dynamic>.from(candidates!.map((x) => x.toJson())),
        "additional_candidates": additionalCandidates == null ? null : additionalCandidates!.toJson(),
        "smart_thumbnail_enabled": smartThumbnailEnabled,
    };
}

class AdditionalCandidates {
    AdditionalCandidates({
        required this.igtvFirstFrame,
        required this.firstFrame,
        required this.smartFrame,
    });

    Candidate? igtvFirstFrame;
    Candidate? firstFrame;
    dynamic smartFrame;

    factory AdditionalCandidates.fromJson(Map<String, dynamic> json) => AdditionalCandidates(
        igtvFirstFrame: json["igtv_first_frame"] == null ? null : Candidate.fromJson(json["igtv_first_frame"]),
        firstFrame: json["first_frame"] == null ? null : Candidate.fromJson(json["first_frame"]),
        smartFrame: json["smart_frame"],
    );

    Map<String, dynamic> toJson() => {
        "igtv_first_frame": igtvFirstFrame == null ? null : igtvFirstFrame!.toJson(),
        "first_frame": firstFrame == null ? null : firstFrame!.toJson(),
        "smart_frame": smartFrame,
    };
}

class MediaCroppingInfo {
    MediaCroppingInfo({
        required this.squareCrop,
    });

    SquareCrop ?squareCrop;

    factory MediaCroppingInfo.fromJson(Map<String, dynamic> json) => MediaCroppingInfo(
        squareCrop: json["square_crop"] == null ? null : SquareCrop.fromJson(json["square_crop"]),
    );

    Map<String, dynamic> toJson() => {
        "square_crop": squareCrop == null ? null : squareCrop!.toJson(),
    };
}

class SquareCrop {
    SquareCrop({
        required this.cropLeft,
        required this.cropRight,
        required this.cropTop,
        required this.cropBottom,
    });

    double ?cropLeft;
    double ?cropRight;
    double ?cropTop;
    double ?cropBottom;

    factory SquareCrop.fromJson(Map<String, dynamic> json) => SquareCrop(
        cropLeft: json["crop_left"],
        cropRight: json["crop_right"],
        cropTop: json["crop_top"],
        cropBottom: json["crop_bottom"],
    );

    Map<String, dynamic> toJson() => {
        "crop_left": cropLeft,
        "crop_right": cropRight,
        "crop_top": cropTop,
        "crop_bottom": cropBottom,
    };
}

class PurpleUser {
    PurpleUser({
        required this.pk,
        required this.username,
        required this.fullName,
        required this.isPrivate,
        required this.pkId,
        required this.profilePicUrl,
        required this.profilePicId,
        required this.isVerified,
        required this.hasAnonymousProfilePicture,
        required this.isUnpublished,
        required this.hasHighlightReels,
        required this.transparencyProductEnabled,
        required this.accountBadges,
        required this.fanClubInfo,
    });

    String ?pk;
    String ?username;
    String ?fullName;
    bool ?isPrivate;
    String ?pkId;
    String ?profilePicUrl;
    String ?profilePicId;
    bool ?isVerified;
    bool ?hasAnonymousProfilePicture;
    bool ?isUnpublished;
    bool ?hasHighlightReels;
    bool ?transparencyProductEnabled;
    List<dynamic> ?accountBadges;
    FanClubInfo ?fanClubInfo;

    factory PurpleUser.fromJson(Map<String, dynamic> json) => PurpleUser(
        pk: json["pk"],
        username: json["username"],
        fullName: json["full_name"],
        isPrivate: json["is_private"],
        pkId: json["pk_id"],
        profilePicUrl: json["profile_pic_url"],
        profilePicId: json["profile_pic_id"],
        isVerified: json["is_verified"],
        hasAnonymousProfilePicture: json["has_anonymous_profile_picture"],
        isUnpublished: json["is_unpublished"],
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
        "is_verified": isVerified,
        "has_anonymous_profile_picture": hasAnonymousProfilePicture,
        "is_unpublished": isUnpublished,
        "has_highlight_reels": hasHighlightReels,
        "transparency_product_enabled": transparencyProductEnabled,
        "account_badges": accountBadges == null ? null : List<dynamic>.from(accountBadges!.map((x) => x)),
        "fan_club_info": fanClubInfo == null ? null : fanClubInfo?.toJson(),
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

class EnumValues<T> {
    Map<String, T> ?map;
    Map<T, String> ?reverseMap;

    EnumValues(this.map);

    Map<T, String>? get reverse {
        reverseMap ??= map!.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
