// To parse this JSON data, do
//
//     final likersModel = likersModelFromJson(jsonString);

import 'dart:convert';

LikersModel likersModelFromJson(String str) => LikersModel.fromJson(json.decode(str));

String likersModelToJson(LikersModel data) => json.encode(data.toJson());

class LikersModel {
    LikersModel({
        required this.users,
        required this.userCount,
        required this.mediaInfo,
        required this.status,
    });

    List<UserElement> ?users;
    int ?userCount;
    MediaInfo ?mediaInfo;
    String ?status;

    factory LikersModel.fromJson(Map<String, dynamic> json) => LikersModel(
        users: json["users"] == null ? null : List<UserElement>.from(json["users"].map((x) => UserElement.fromJson(x))),
        userCount: json["user_count"],
        mediaInfo: json["media_info"] == null ? null : MediaInfo.fromJson(json["media_info"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "users": users == null ? null : List<dynamic>.from(users!.map((x) => x.toJson())),
        "user_count": userCount,
        "media_info": mediaInfo == null ? null : mediaInfo!.toJson(),
        "status": status,
    };
}

class MediaInfo {
    MediaInfo({
        required this.takenAt,
        required this.pk,
        required this.id,
        required this.deviceTimestamp,
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
        required this.photoOfYou,
        required this.isOrganicProductTaggingEligible,
        required this.canSeeInsightsAsBrand,
        required this.user,
        required this.canViewerReshare,
        required this.likeCount,
        required this.hasLiked,
        required this.imageVersions2,
        required this.originalWidth,
        required this.originalHeight,
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
    });

    int ?takenAt;
    String ?pk;
    String ?id;
    int ?deviceTimestamp;
    String ?code;
    String ?clientCacheKey;
    int ?filterType;
    bool ?isUnifiedVideo;
    bool ?shouldRequestAds;
    bool ?originalMediaHasVisualReplyMedia;
    bool ?captionIsEdited;
    bool ?likeAndViewCountsDisabled;
    String ?commercialityStatus;
    bool ?isPaidPartnership;
    bool ?isVisualReplyCommenterNoticeEnabled;
    List<dynamic> ?clipsTabPinnedUserIds;
    bool ?hasDelayedMetadata;
    FundraiserTag ?fundraiserTag;
    bool ?commentLikesEnabled;
    bool ?commentThreadingEnabled;
    int ?maxNumVisiblePreviewComments;
    bool? hasMoreComments;
    List<dynamic> ?previewComments;
    int ?commentCount;
    bool ?canViewMorePreviewComments;
    bool ?hideViewAllCommentEntrypoint;
    bool ?photoOfYou;
    bool ?isOrganicProductTaggingEligible;
    bool ?canSeeInsightsAsBrand;
    MediaInfoUser? user;
    bool ?canViewerReshare;
    int ?likeCount;
    bool ?hasLiked;
    ImageVersions2? imageVersions2;
    int ?originalWidth;
    int ?originalHeight;
    dynamic caption;
    CommentInformTreatment? commentInformTreatment;
    SharingFrictionInfo ?sharingFrictionInfo;
    bool ?canViewerSave;
    bool ?isInProfileGrid;
    bool ?profileGridControlEnabled;
    String ?organicTrackingToken;
    int ?hasSharedToFb;
    String ?productType;
    int ?deletedReason;
    String ?integrityReviewDecision;
    dynamic commerceIntegrityReviewDecision;
    MusicMetadata? musicMetadata;
    bool ?isArtistPick;

    factory MediaInfo.fromJson(Map<String, dynamic> json) => MediaInfo(
        takenAt: json["taken_at"],
        pk: json["pk"] == null ? null : json["pk"].toDouble(),
        id: json["id"],
        deviceTimestamp: json["device_timestamp"],
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
        photoOfYou: json["photo_of_you"],
        isOrganicProductTaggingEligible: json["is_organic_product_tagging_eligible"],
        canSeeInsightsAsBrand: json["can_see_insights_as_brand"],
        user: json["user"] == null ? null : MediaInfoUser.fromJson(json["user"]),
        canViewerReshare: json["can_viewer_reshare"],
        likeCount: json["like_count"],
        hasLiked: json["has_liked"],
        imageVersions2: json["image_versions2"] == null ? null : ImageVersions2.fromJson(json["image_versions2"]),
        originalWidth: json["original_width"],
        originalHeight: json["original_height"],
        caption: json["caption"],
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
        musicMetadata: json["music_metadata"] == null ? null : MusicMetadata.fromJson(json["music_metadata"]),
        isArtistPick: json["is_artist_pick"],
    );

    Map<String, dynamic> toJson() => {
        "taken_at": takenAt,
        "pk": pk,
        "id": id,
        "device_timestamp": deviceTimestamp,
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
        "photo_of_you": photoOfYou,
        "is_organic_product_tagging_eligible": isOrganicProductTaggingEligible,
        "can_see_insights_as_brand": canSeeInsightsAsBrand,
        "user": user == null ? null : user!.toJson(),
        "can_viewer_reshare": canViewerReshare,
        "like_count": likeCount,
        "has_liked": hasLiked,
        "image_versions2": imageVersions2 == null ? null : imageVersions2!.toJson(),
        "original_width": originalWidth,
        "original_height": originalHeight,
        "caption": caption,
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
        "music_metadata": musicMetadata == null ? null : musicMetadata!.toJson(),
        "is_artist_pick": isArtistPick,
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

enum ScansProfile { E35 }

final scansProfileValues = EnumValues({
    "e35": ScansProfile.E35
});

class MusicMetadata {
    MusicMetadata({
        required this.musicCanonicalId,
        required this.audioType,
        required this.musicInfo,
        required this.originalSoundInfo,
        required this.pinnedMediaIds,
    });

    String ?musicCanonicalId;
    String ?audioType;
    MusicInfo ?musicInfo;
    dynamic originalSoundInfo;
    List<dynamic> ?pinnedMediaIds;

    factory MusicMetadata.fromJson(Map<String, dynamic> json) => MusicMetadata(
        musicCanonicalId: json["music_canonical_id"],
        audioType: json["audio_type"],
        musicInfo: json["music_info"] == null ? null : MusicInfo.fromJson(json["music_info"]),
        originalSoundInfo: json["original_sound_info"],
        pinnedMediaIds: json["pinned_media_ids"] == null ? null : List<dynamic>.from(json["pinned_media_ids"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "music_canonical_id": musicCanonicalId,
        "audio_type": audioType,
        "music_info": musicInfo == null ? null : musicInfo!.toJson(),
        "original_sound_info": originalSoundInfo,
        "pinned_media_ids": pinnedMediaIds == null ? null : List<dynamic>.from(pinnedMediaIds!.map((x) => x)),
    };
}

class MusicInfo {
    MusicInfo({
        required this.musicAssetInfo,
        required this.musicConsumptionInfo,
        required this.musicCanonicalId,
    });

    MusicAssetInfo ?musicAssetInfo;
    MusicConsumptionInfo ?musicConsumptionInfo;
    dynamic musicCanonicalId;

    factory MusicInfo.fromJson(Map<String, dynamic> json) => MusicInfo(
        musicAssetInfo: json["music_asset_info"] == null ? null : MusicAssetInfo.fromJson(json["music_asset_info"]),
        musicConsumptionInfo: json["music_consumption_info"] == null ? null : MusicConsumptionInfo.fromJson(json["music_consumption_info"]),
        musicCanonicalId: json["music_canonical_id"],
    );

    Map<String, dynamic> toJson() => {
        "music_asset_info": musicAssetInfo == null ? null : musicAssetInfo!.toJson(),
        "music_consumption_info": musicConsumptionInfo == null ? null : musicConsumptionInfo!.toJson(),
        "music_canonical_id": musicCanonicalId,
    };
}

class MusicAssetInfo {
    MusicAssetInfo({
        required this.audioClusterId,
        required this.id,
        required this.title,
        required this.sanitizedTitle,
        required this.subtitle,
        required this.displayArtist,
        required this.artistId,
        required this.coverArtworkUri,
        required this.coverArtworkThumbnailUri,
        required this.progressiveDownloadUrl,
        required this.reactiveAudioDownloadUrl,
        required this.fastStartProgressiveDownloadUrl,
        required this.web30SPreviewDownloadUrl,
        required this.highlightStartTimesInMs,
        required this.isExplicit,
        required this.dashManifest,
        required this.hasLyrics,
        required this.audioAssetId,
        required this.durationInMs,
        required this.darkMessage,
        required this.allowsSaving,
        required this.territoryValidityPeriods,
        required this.igUsername,
    });

    String ?audioClusterId;
    String ?id;
    String ?title;
    dynamic sanitizedTitle;
    String ?subtitle;
    String ?displayArtist;
    String ?artistId;
    String ?coverArtworkUri;
    String ?coverArtworkThumbnailUri;
    String ?progressiveDownloadUrl;
    dynamic reactiveAudioDownloadUrl;
    String ?fastStartProgressiveDownloadUrl;
    dynamic web30SPreviewDownloadUrl;
    List<int> ?highlightStartTimesInMs;
    bool ?isExplicit;
    String ?dashManifest;
    bool ?hasLyrics;
    String ?audioAssetId;
    int ?durationInMs;
    dynamic darkMessage;
    bool ?allowsSaving;
    TerritoryValidityPeriods? territoryValidityPeriods;
    String ?igUsername;

    factory MusicAssetInfo.fromJson(Map<String, dynamic> json) => MusicAssetInfo(
        audioClusterId: json["audio_cluster_id"],
        id: json["id"],
        title: json["title"],
        sanitizedTitle: json["sanitized_title"],
        subtitle: json["subtitle"],
        displayArtist: json["display_artist"],
        artistId: json["artist_id"],
        coverArtworkUri: json["cover_artwork_uri"],
        coverArtworkThumbnailUri: json["cover_artwork_thumbnail_uri"],
        progressiveDownloadUrl: json["progressive_download_url"],
        reactiveAudioDownloadUrl: json["reactive_audio_download_url"],
        fastStartProgressiveDownloadUrl: json["fast_start_progressive_download_url"],
        web30SPreviewDownloadUrl: json["web_30s_preview_download_url"],
        highlightStartTimesInMs: json["highlight_start_times_in_ms"] == null ? null : List<int>.from(json["highlight_start_times_in_ms"].map((x) => x)),
        isExplicit: json["is_explicit"],
        dashManifest: json["dash_manifest"],
        hasLyrics: json["has_lyrics"],
        audioAssetId: json["audio_asset_id"],
        durationInMs: json["duration_in_ms"],
        darkMessage: json["dark_message"],
        allowsSaving: json["allows_saving"],
        territoryValidityPeriods: json["territory_validity_periods"] == null ? null : TerritoryValidityPeriods.fromJson(json["territory_validity_periods"]),
        igUsername: json["ig_username"],
    );

    Map<String, dynamic> toJson() => {
        "audio_cluster_id": audioClusterId,
        "id": id,
        "title": title,
        "sanitized_title": sanitizedTitle,
        "subtitle": subtitle,
        "display_artist": displayArtist,
        "artist_id": artistId,
        "cover_artwork_uri": coverArtworkUri,
        "cover_artwork_thumbnail_uri": coverArtworkThumbnailUri,
        "progressive_download_url": progressiveDownloadUrl,
        "reactive_audio_download_url": reactiveAudioDownloadUrl,
        "fast_start_progressive_download_url": fastStartProgressiveDownloadUrl,
        "web_30s_preview_download_url": web30SPreviewDownloadUrl,
        "highlight_start_times_in_ms": highlightStartTimesInMs == null ? null : List<dynamic>.from(highlightStartTimesInMs!.map((x) => x)),
        "is_explicit": isExplicit,
        "dash_manifest": dashManifest,
        "has_lyrics": hasLyrics,
        "audio_asset_id": audioAssetId,
        "duration_in_ms": durationInMs,
        "dark_message": darkMessage,
        "allows_saving": allowsSaving,
        "territory_validity_periods": territoryValidityPeriods == null ? null : territoryValidityPeriods!.toJson(),
        "ig_username": igUsername,
    };
}

class TerritoryValidityPeriods {
    TerritoryValidityPeriods();

    factory TerritoryValidityPeriods.fromJson(Map<String, dynamic> json) => TerritoryValidityPeriods(
    );

    Map<String, dynamic> toJson() => {
    };
}

class MusicConsumptionInfo {
    MusicConsumptionInfo({
        required this.igArtist,
        required this.placeholderProfilePicUrl,
        required this.shouldMuteAudio,
        required this.shouldMuteAudioReason,
        required this.shouldMuteAudioReasonType,
        required this.isBookmarked,
        required this.overlapDurationInMs,
        required this.audioAssetStartTimeInMs,
        required this.allowMediaCreationWithMusic,
        required this.isTrendingInClips,
        required this.formattedClipsMediaCount,
        required this.streamingServices,
        required this.displayLabels,
        required this.shouldAllowMusicEditing,
    });

    UserElement ?igArtist;
    String ?placeholderProfilePicUrl;
    bool ?shouldMuteAudio;
    String? shouldMuteAudioReason;
    dynamic shouldMuteAudioReasonType;
    bool ?isBookmarked;
    int ?overlapDurationInMs;
    int ?audioAssetStartTimeInMs;
    bool ?allowMediaCreationWithMusic;
    bool ?isTrendingInClips;
    dynamic formattedClipsMediaCount;
    dynamic streamingServices;
    dynamic displayLabels;
    bool ?shouldAllowMusicEditing;

    factory MusicConsumptionInfo.fromJson(Map<String, dynamic> json) => MusicConsumptionInfo(
        igArtist: json["ig_artist"] == null ? null : UserElement.fromJson(json["ig_artist"]),
        placeholderProfilePicUrl: json["placeholder_profile_pic_url"],
        shouldMuteAudio: json["should_mute_audio"],
        shouldMuteAudioReason: json["should_mute_audio_reason"],
        shouldMuteAudioReasonType: json["should_mute_audio_reason_type"],
        isBookmarked: json["is_bookmarked"],
        overlapDurationInMs: json["overlap_duration_in_ms"],
        audioAssetStartTimeInMs: json["audio_asset_start_time_in_ms"],
        allowMediaCreationWithMusic: json["allow_media_creation_with_music"],
        isTrendingInClips: json["is_trending_in_clips"],
        formattedClipsMediaCount: json["formatted_clips_media_count"],
        streamingServices: json["streaming_services"],
        displayLabels: json["display_labels"],
        shouldAllowMusicEditing: json["should_allow_music_editing"],
    );

    Map<String, dynamic> toJson() => {
        "ig_artist": igArtist == null ? null : igArtist!.toJson(),
        "placeholder_profile_pic_url": placeholderProfilePicUrl,
        "should_mute_audio": shouldMuteAudio,
        "should_mute_audio_reason": shouldMuteAudioReason,
        "should_mute_audio_reason_type": shouldMuteAudioReasonType,
        "is_bookmarked": isBookmarked,
        "overlap_duration_in_ms": overlapDurationInMs,
        "audio_asset_start_time_in_ms": audioAssetStartTimeInMs,
        "allow_media_creation_with_music": allowMediaCreationWithMusic,
        "is_trending_in_clips": isTrendingInClips,
        "formatted_clips_media_count": formattedClipsMediaCount,
        "streaming_services": streamingServices,
        "display_labels": displayLabels,
        "should_allow_music_editing": shouldAllowMusicEditing,
    };
}

class UserElement {
    UserElement({
        required this.pk,
        required this.username,
        required this.profilePicUrl,
        required this.profilePicId,
        required this.isVerified,
        required this.pkId,
        required this.isPrivate,
        required this.fullName,
        required this.accountBadges,
        required this.latestReelMedia,
    });

    String? pk;
    String? username;
    String? profilePicUrl;
    String? profilePicId;
    bool ?isVerified;
    String? pkId;
    bool ?isPrivate;
    String? fullName;
    List<dynamic>? accountBadges;
    int ?latestReelMedia;

    factory UserElement.fromJson(Map<String, dynamic> json) => UserElement(
        pk: json["pk"],
        username: json["username"],
        profilePicUrl: json["profile_pic_url"],
        profilePicId: json["profile_pic_id"],
        isVerified: json["is_verified"],
        pkId: json["pk_id"],
        isPrivate: json["is_private"],
        fullName: json["full_name"],
        accountBadges: json["account_badges"] == null ? null : List<dynamic>.from(json["account_badges"].map((x) => x)),
        latestReelMedia: json["latest_reel_media"],
    );

    Map<String, dynamic> toJson() => {
        "pk": pk,
        "username": username,
        "profile_pic_url": profilePicUrl,
        "profile_pic_id": profilePicId,
        "is_verified": isVerified,
        "pk_id": pkId,
        "is_private": isPrivate,
        "full_name": fullName,
        "account_badges": accountBadges == null ? null : List<dynamic>.from(accountBadges!.map((x) => x)),
        "latest_reel_media": latestReelMedia,
    };
}

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

class MediaInfoUser {
    MediaInfoUser({
        required this.pk,
        required this.username,
        required this.profilePicUrl,
        required this.profilePicId,
        required this.friendshipStatus,
        required this.pkId,
        required this.isPrivate,
        required this.fullName,
        required this.hasAnonymousProfilePicture,
        required this.isUnpublished,
        required this.isFavorite,
        required this.hasHighlightReels,
        required this.fanClubInfo,
        required this.accountBadges,
        required this.transparencyProductEnabled,
    });

    String ?pk;
    String ?username;
    String ?profilePicUrl;
    String ?profilePicId;
    FriendshipStatus? friendshipStatus;
    String ?pkId;
    bool ?isPrivate;
    String? fullName;
    bool ?hasAnonymousProfilePicture;
    bool ?isUnpublished;
    bool ?isFavorite;
    bool ?hasHighlightReels;
    FanClubInfo? fanClubInfo;
    List<dynamic>? accountBadges;
    bool ?transparencyProductEnabled;

    factory MediaInfoUser.fromJson(Map<String, dynamic> json) => MediaInfoUser(
        pk: json["pk"],
        username: json["username"],
        profilePicUrl: json["profile_pic_url"],
        profilePicId: json["profile_pic_id"],
        friendshipStatus: json["friendship_status"] == null ? null : FriendshipStatus.fromJson(json["friendship_status"]),
        pkId: json["pk_id"],
        isPrivate: json["is_private"],
        fullName: json["full_name"],
        hasAnonymousProfilePicture: json["has_anonymous_profile_picture"],
        isUnpublished: json["is_unpublished"],
        isFavorite: json["is_favorite"],
        hasHighlightReels: json["has_highlight_reels"],
        fanClubInfo: json["fan_club_info"] == null ? null : FanClubInfo.fromJson(json["fan_club_info"]),
        accountBadges: json["account_badges"] == null ? null : List<dynamic>.from(json["account_badges"].map((x) => x)),
        transparencyProductEnabled: json["transparency_product_enabled"],
    );

    Map<String, dynamic> toJson() => {
        "pk": pk,
        "username": username,
        "profile_pic_url": profilePicUrl,
        "profile_pic_id": profilePicId,
        "friendship_status": friendshipStatus == null ? null : friendshipStatus!.toJson(),
        "pk_id": pkId,
        "is_private": isPrivate,
        "full_name": fullName,
        "has_anonymous_profile_picture": hasAnonymousProfilePicture,
        "is_unpublished": isUnpublished,
        "is_favorite": isFavorite,
        "has_highlight_reels": hasHighlightReels,
        "fan_club_info": fanClubInfo == null ? null : fanClubInfo!.toJson(),
        "account_badges": accountBadges == null ? null : List<dynamic>.from(accountBadges!.map((x) => x)),
        "transparency_product_enabled": transparencyProductEnabled,
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

    bool ?following;
    bool ?outgoingRequest;
    bool ?isBestie;
    bool ?isRestricted;
    bool ?isFeedFavorite;

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

class EnumValues<T> {
    Map<String, T> ?map;
    Map<T, String> ?reverseMap;

    EnumValues(this.map);

    Map<T, String>? get reverse {
        reverseMap ??= map!.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
