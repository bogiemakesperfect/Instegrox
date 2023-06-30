// To parse this JSON data, do
//
//     final userStories = userStoriesFromJson(jsonString);
import 'dart:convert';

UserStories userStoriesFromJson(String str) => UserStories.fromJson(json.decode(str));

String userStoriesToJson(UserStories data) => json.encode(data.toJson());

class UserStories {
    UserStories({
        required this.tray,
        required this.storyRankingToken,
        required this.storyLikesConfig,
        required this.storyWedgingConfig,
        required this.rollcallConfig,
        required this.broadcasts,
        required this.stickerVersion,
        required this.faceFilterNuxVersion,
        required this.storiesViewerGesturesNuxEligible,
        required this.hasNewNuxStory,
        required this.refreshWindowMs,
        required this.responseTimestamp,
        required this.status,
    });

    List<Tray>? tray;
    String? storyRankingToken;
    StoryLikesConfig? storyLikesConfig;
    StoryWedgingConfig? storyWedgingConfig;
    RollcallConfig? rollcallConfig;
    List<dynamic>? broadcasts;
    int? stickerVersion;
    int? faceFilterNuxVersion;
    bool? storiesViewerGesturesNuxEligible;
    bool? hasNewNuxStory;
    int? refreshWindowMs;
    int? responseTimestamp;
    String? status;

    factory UserStories.fromJson(Map<String, dynamic> json) => UserStories(
        tray: json["tray"] == null ? null : List<Tray>.from(json["tray"].map((x) => Tray.fromJson(x))),
        storyRankingToken: json["story_ranking_token"],
        storyLikesConfig: json["story_likes_config"] == null ? null : StoryLikesConfig.fromJson(json["story_likes_config"]),
        storyWedgingConfig: json["story_wedging_config"] == null ? null : StoryWedgingConfig.fromJson(json["story_wedging_config"]),
        rollcallConfig: json["rollcall_config"] == null ? null : RollcallConfig.fromJson(json["rollcall_config"]),
        broadcasts: json["broadcasts"] == null ? null : List<dynamic>.from(json["broadcasts"].map((x) => x)),
        stickerVersion: json["sticker_version"],
        faceFilterNuxVersion: json["face_filter_nux_version"],
        storiesViewerGesturesNuxEligible: json["stories_viewer_gestures_nux_eligible"],
        hasNewNuxStory: json["has_new_nux_story"],
        refreshWindowMs: json["refresh_window_ms"],
        responseTimestamp: json["response_timestamp"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "tray": tray == null ? null : List<dynamic>.from(tray!.map((x) => x.toJson())),
        "story_ranking_token": storyRankingToken,
        "story_likes_config": storyLikesConfig == null ? null : storyLikesConfig!.toJson(),
        "story_wedging_config": storyWedgingConfig == null ? null : storyWedgingConfig!.toJson(),
        "rollcall_config": rollcallConfig == null ? null : rollcallConfig!.toJson(),
        "broadcasts": broadcasts == null ? null : List<dynamic>.from(broadcasts!.map((x) => x)),
        "sticker_version": stickerVersion,
        "face_filter_nux_version": faceFilterNuxVersion,
        "stories_viewer_gestures_nux_eligible": storiesViewerGesturesNuxEligible,
        "has_new_nux_story": hasNewNuxStory,
        "refresh_window_ms": refreshWindowMs,
        "response_timestamp": responseTimestamp,
        "status": status,
    };
}

class RollcallConfig {
    RollcallConfig({
        required this.isUnlocked,
    });

    bool isUnlocked;

    factory RollcallConfig.fromJson(Map<String, dynamic> json) => RollcallConfig(
        isUnlocked: json["is_unlocked"],
    );

    Map<String, dynamic> toJson() => {
        "is_unlocked": isUnlocked,
    };
}

class StoryLikesConfig {
    StoryLikesConfig({
        required this.isEnabled,
        required this.ufiType,
    });

    bool isEnabled;
    int ufiType;

    factory StoryLikesConfig.fromJson(Map<String, dynamic> json) => StoryLikesConfig(
        isEnabled: json["is_enabled"],
        ufiType: json["ufi_type"],
    );

    Map<String, dynamic> toJson() => {
        "is_enabled": isEnabled,
        "ufi_type": ufiType,
    };
}

class StoryWedgingConfig {
    StoryWedgingConfig({
        required this.storyWedgingType,
        required this.storyWedgeSize,
        required this.displayShowAllLastNMedia,
    });

    String storyWedgingType;
    int storyWedgeSize;
    int displayShowAllLastNMedia;

    factory StoryWedgingConfig.fromJson(Map<String, dynamic> json) => StoryWedgingConfig(
        storyWedgingType: json["story_wedging_type"],
        storyWedgeSize: json["story_wedge_size"],
        displayShowAllLastNMedia: json["display_show_all_last_n_media"],
    );

    Map<String, dynamic> toJson() => {
        "story_wedging_type": storyWedgingType,
        "story_wedge_size": storyWedgeSize,
        "display_show_all_last_n_media": displayShowAllLastNMedia,
    };
}

class Tray {
    Tray({
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
        required this.rankedPosition,
        required this.seenRankedPosition,
        required this.muted,
        required this.prefetchCount,
        required this.storyWedgeSize,
        required this.hasBestiesMedia,
        required this.latestBestiesReelMedia,
        required this.mediaCount,
        required this.mediaIds,
        required this.hasVideo,
        required this.hasFanClubMedia,
        required this.hasPrideMedia,
        required this.hideFromFeedUnit,
        required this.items,
        required this.isCacheable,
        required this.rankerScores,
        required this.storyDurationSecs,
    });

    String? id;
    int? latestReelMedia;
    int? expiringAt;
    int? seen;
    bool? canReply;
    bool? canGifQuickReply;
    bool? canReshare;
    bool? canReactWithAvatar;
    ReelType? reelType;
    dynamic adExpiryTimestampInMillis;
    dynamic isCtaStickerAvailable;
    UserElement? user;
    int? rankedPosition;
    int? seenRankedPosition;
    bool? muted;
    int? prefetchCount;
    int? storyWedgeSize;
    bool? hasBestiesMedia;
    double? latestBestiesReelMedia;
    int? mediaCount;
    List<String>? mediaIds;
    bool? hasVideo;
    bool? hasFanClubMedia;
    bool? hasPrideMedia;
    bool? hideFromFeedUnit;
    List<Item>? items;
    bool? isCacheable;
    RankerScores? rankerScores;
    int? storyDurationSecs;

    factory Tray.fromJson(Map<String, dynamic> json) => Tray(
        id: json["id"],
        latestReelMedia: json["latest_reel_media"],
        expiringAt: json["expiring_at"],
        seen: json["seen"],
        canReply: json["can_reply"],
        canGifQuickReply: json["can_gif_quick_reply"],
        canReshare: json["can_reshare"],
        canReactWithAvatar: json["can_react_with_avatar"],
        reelType: json["reel_type"] == null ? null : reelTypeValues.map[json["reel_type"]],
        adExpiryTimestampInMillis: json["ad_expiry_timestamp_in_millis"],
        isCtaStickerAvailable: json["is_cta_sticker_available"],
        user: json["user"] == null ? null : UserElement.fromJson(json["user"]),
        rankedPosition: json["ranked_position"],
        seenRankedPosition: json["seen_ranked_position"],
        muted: json["muted"],
        prefetchCount: json["prefetch_count"],
        storyWedgeSize: json["story_wedge_size"],
        hasBestiesMedia: json["has_besties_media"],
        latestBestiesReelMedia: json["latest_besties_reel_media"],
        mediaCount: json["media_count"], // ? ÖNEMLİ
        mediaIds: json["media_ids"] == null ? null : List<String>.from(json["media_ids"].map((x) => x)),// ? ÖNEMLİ
        hasVideo: json["has_video"],
        hasFanClubMedia: json["has_fan_club_media"],
        hasPrideMedia: json["has_pride_media"],
        hideFromFeedUnit: json["hide_from_feed_unit"],
        items: json["items"] == null ? null : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        isCacheable: json["is_cacheable"],
        rankerScores: json["ranker_scores"] == null ? null : RankerScores.fromJson(json["ranker_scores"]),
        storyDurationSecs: json["story_duration_secs"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "latest_reel_media": latestReelMedia,
        "expiring_at": expiringAt,
        "seen": seen,
        "can_reply": canReply,
        "can_gif_quick_reply": canGifQuickReply,
        "can_reshare": canReshare,
        "can_react_with_avatar": canReactWithAvatar,
        "reel_type": reelType == null ? null : reelTypeValues.reverse[reelType],
        "ad_expiry_timestamp_in_millis": adExpiryTimestampInMillis,
        "is_cta_sticker_available": isCtaStickerAvailable,
        "user": user == null ? null : user!.toJson(),
        "ranked_position": rankedPosition,
        "seen_ranked_position": seenRankedPosition,
        "muted": muted,
        "prefetch_count": prefetchCount,
        "story_wedge_size": storyWedgeSize,
        "has_besties_media": hasBestiesMedia,
        "latest_besties_reel_media": latestBestiesReelMedia,
        "media_count": mediaCount,
        "media_ids": mediaIds == null ? null : List<dynamic>.from(mediaIds!.map((x) => x)),
        "has_video": hasVideo,
        "has_fan_club_media": hasFanClubMedia,
        "has_pride_media": hasPrideMedia,
        "hide_from_feed_unit": hideFromFeedUnit,
        "items": items == null ? null : List<dynamic>.from(items!.map((x) => x.toJson())),
        "is_cacheable": isCacheable,
        "ranker_scores": rankerScores == null ? null : rankerScores!.toJson(),
        "story_duration_secs": storyDurationSecs,
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
        required this.audience,
        required this.productType,
        required this.deletedReason,
        required this.integrityReviewDecision,
        required this.commerceIntegrityReviewDecision,
        required this.musicMetadata,
        required this.isArtistPick,
        required this.user,
        required this.canReshare,
        required this.canReply,
        required this.canSendPrompt,
        required this.isFirstTake,
        required this.isRollcallV2,
        required this.storyFeedMedia,
        required this.storyMusicStickers,
        required this.storyIsSavedToArchive,
        required this.storyStaticModels,
        required this.viewers,
        required this.viewerCount,
        required this.fbViewerCount,
        required this.viewerCursor,
        required this.totalViewerCount,
        required this.multiAuthorReelNames,
        required this.supportsReelReactions,
        required this.canSendCustomEmojis,
        required this.showOneTapFbShareTooltip,
        required this.hasSharedToFbDating,
        required this.sourceType,
        required this.mentionSharingEnabled,
        required this.storyMusicLyricStickers,
        required this.fbUserTags,
        required this.reelMentions,
        required this.storyAppAttribution,
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
    double? captionPosition;
    bool? isReelMedia;
    bool? photoOfYou;
    bool? isOrganicProductTaggingEligible;
    bool? canSeeInsightsAsBrand;
    ImageVersions2? imageVersions2;
    int? originalWidth;
    int? originalHeight;
    dynamic caption;
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
    String? audience;
    String? productType;
    int? deletedReason;
    String? integrityReviewDecision;
    dynamic commerceIntegrityReviewDecision;
    dynamic musicMetadata;
    bool? isArtistPick;
    PurpleUser? user;
    bool? canReshare;
    bool? canReply;
    bool? canSendPrompt;
    bool? isFirstTake;
    bool? isRollcallV2;
    List<StoryFeedMedia>? storyFeedMedia;
    List<ReelMention>? storyMusicStickers;
    bool? storyIsSavedToArchive;
    List<dynamic>? storyStaticModels;
    List<UserElement>? viewers;
    int? viewerCount;
    dynamic fbViewerCount;
    String? viewerCursor;
    int? totalViewerCount;
    List<dynamic>? multiAuthorReelNames;
    bool? supportsReelReactions;
    bool? canSendCustomEmojis;
    bool? showOneTapFbShareTooltip;
    int? hasSharedToFbDating;
    int? sourceType;
    bool? mentionSharingEnabled;
    List<ReelMention>? storyMusicLyricStickers;
    FbUserTags? fbUserTags;
    List<ReelMention>? reelMentions;
    StoryAppAttribution? storyAppAttribution;

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
        captionPosition: json["caption_position"],
        isReelMedia: json["is_reel_media"],
        photoOfYou: json["photo_of_you"],
        isOrganicProductTaggingEligible: json["is_organic_product_tagging_eligible"],
        canSeeInsightsAsBrand: json["can_see_insights_as_brand"],
        imageVersions2: json["image_versions2"] == null ? null : ImageVersions2.fromJson(json["image_versions2"]),
        originalWidth: json["original_width"],
        originalHeight: json["original_height"],
        caption: json["caption"],
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
        audience: json["audience"],
        productType: json["product_type"],
        deletedReason: json["deleted_reason"],
        integrityReviewDecision: json["integrity_review_decision"],
        commerceIntegrityReviewDecision: json["commerce_integrity_review_decision"],
        musicMetadata: json["music_metadata"],
        isArtistPick: json["is_artist_pick"],
        user: json["user"] == null ? null : PurpleUser.fromJson(json["user"]),
        canReshare: json["can_reshare"],
        canReply: json["can_reply"],
        canSendPrompt: json["can_send_prompt"],
        isFirstTake: json["is_first_take"],
        isRollcallV2: json["is_rollcall_v2"],
        storyFeedMedia: json["story_feed_media"] == null ? null : List<StoryFeedMedia>.from(json["story_feed_media"].map((x) => StoryFeedMedia.fromJson(x))),
        storyMusicStickers: json["story_music_stickers"] == null ? null : List<ReelMention>.from(json["story_music_stickers"].map((x) => ReelMention.fromJson(x))),
        storyIsSavedToArchive: json["story_is_saved_to_archive"],
        storyStaticModels: json["story_static_models"] == null ? null : List<dynamic>.from(json["story_static_models"].map((x) => x)),
        viewers: json["viewers"] == null ? null : List<UserElement>.from(json["viewers"].map((x) => UserElement.fromJson(x))),
        viewerCount: json["viewer_count"],
        fbViewerCount: json["fb_viewer_count"],
        viewerCursor: json["viewer_cursor"],
        totalViewerCount: json["total_viewer_count"],
        multiAuthorReelNames: json["multi_author_reel_names"] == null ? null : List<dynamic>.from(json["multi_author_reel_names"].map((x) => x)),
        supportsReelReactions: json["supports_reel_reactions"],
        canSendCustomEmojis: json["can_send_custom_emojis"],
        showOneTapFbShareTooltip: json["show_one_tap_fb_share_tooltip"],
        hasSharedToFbDating: json["has_shared_to_fb_dating"],
        sourceType: json["source_type"],
        mentionSharingEnabled: json["mention_sharing_enabled"],
        storyMusicLyricStickers: json["story_music_lyric_stickers"] == null ? null : List<ReelMention>.from(json["story_music_lyric_stickers"].map((x) => ReelMention.fromJson(x))),
        fbUserTags: json["fb_user_tags"] == null ? null : FbUserTags.fromJson(json["fb_user_tags"]),
        reelMentions: json["reel_mentions"] == null ? null : List<ReelMention>.from(json["reel_mentions"].map((x) => ReelMention.fromJson(x))),
        storyAppAttribution: json["story_app_attribution"] == null ? null : StoryAppAttribution.fromJson(json["story_app_attribution"]),
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
        "caption_position": captionPosition,
        "is_reel_media": isReelMedia,
        "photo_of_you": photoOfYou,
        "is_organic_product_tagging_eligible": isOrganicProductTaggingEligible,
        "can_see_insights_as_brand": canSeeInsightsAsBrand,
        "image_versions2": imageVersions2 == null ? null : imageVersions2!.toJson(),
        "original_width": originalWidth,
        "original_height": originalHeight,
        "caption": caption,
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
        "audience": audience,
        "product_type": productType,
        "deleted_reason": deletedReason,
        "integrity_review_decision": integrityReviewDecision,
        "commerce_integrity_review_decision": commerceIntegrityReviewDecision,
        "music_metadata": musicMetadata,
        "is_artist_pick": isArtistPick,
        "user": user == null ? null : user!.toJson(),
        "can_reshare": canReshare,
        "can_reply": canReply,
        "can_send_prompt": canSendPrompt,
        "is_first_take": isFirstTake,
        "is_rollcall_v2": isRollcallV2,
        "story_feed_media": storyFeedMedia == null ? null : List<dynamic>.from(storyFeedMedia!.map((x) => x.toJson())),
        "story_music_stickers": storyMusicStickers == null ? null : List<dynamic>.from(storyMusicStickers!.map((x) => x.toJson())),
        "story_is_saved_to_archive": storyIsSavedToArchive,
        "story_static_models": storyStaticModels == null ? null : List<dynamic>.from(storyStaticModels!.map((x) => x)),
        "viewers": viewers == null ? null : List<dynamic>.from(viewers!.map((x) => x.toJson())),
        "viewer_count": viewerCount,
        "fb_viewer_count": fbViewerCount,
        "viewer_cursor": viewerCursor,
        "total_viewer_count": totalViewerCount,
        "multi_author_reel_names": multiAuthorReelNames == null ? null : List<dynamic>.from(multiAuthorReelNames!.map((x) => x)),
        "supports_reel_reactions": supportsReelReactions,
        "can_send_custom_emojis": canSendCustomEmojis,
        "show_one_tap_fb_share_tooltip": showOneTapFbShareTooltip,
        "has_shared_to_fb_dating": hasSharedToFbDating,
        "source_type": sourceType,
        "mention_sharing_enabled": mentionSharingEnabled,
        "story_music_lyric_stickers": storyMusicLyricStickers == null ? null : List<dynamic>.from(storyMusicLyricStickers!.map((x) => x.toJson())),
        "fb_user_tags": fbUserTags == null ? null : fbUserTags!.toJson(),
        "reel_mentions": reelMentions == null ? null : List<dynamic>.from(reelMentions!.map((x) => x.toJson())),
        "story_app_attribution": storyAppAttribution == null ? null : storyAppAttribution!.toJson(),
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

class FbUserTags {
    FbUserTags({
        required this.fbUserTagsIn,
    });

    List<dynamic>? fbUserTagsIn;

    factory FbUserTags.fromJson(Map<String, dynamic> json) => FbUserTags(
        fbUserTagsIn: json["in"] == null ? null : List<dynamic>.from(json["in"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "in": fbUserTagsIn == null ? null : List<dynamic>.from(fbUserTagsIn!.map((x) => x)),
    };
}

class FundraiserTag {
    FundraiserTag({
        required this.hasStandaloneFundraiser,
    });

    bool hasStandaloneFundraiser;

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
        required this.estimatedScansSizes,
    });

    int? width;
    int? height;
    String? url;
    ScansProfile? scansProfile;
    List<int>? estimatedScansSizes;

    factory Candidate.fromJson(Map<String, dynamic> json) => Candidate(
        width: json["width"],
        height: json["height"],
        url: json["url"],
        scansProfile: json["scans_profile"] == null ? null : scansProfileValues.map[json["scans_profile"]],
        estimatedScansSizes: json["estimated_scans_sizes"] == null ? null : List<int>.from(json["estimated_scans_sizes"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "url": url,
        "scans_profile": scansProfile == null ? null : scansProfileValues.reverse[scansProfile],
        "estimated_scans_sizes": estimatedScansSizes == null ? null : List<dynamic>.from(estimatedScansSizes!.map((x) => x)),
    };
}

enum ScansProfile { E15, E35 }

final scansProfileValues = EnumValues({
    "e15": ScansProfile.E15,
    "e35": ScansProfile.E35
});

class ReelMention {
    ReelMention({
        required this.x,
        required this.y,
        required this.z,
        required this.width,
        required this.height,
        required this.rotation,
        required this.isPinned,
        required this.isHidden,
        required this.displayType,
        required this.isSticker,
        required this.isFbSticker,
        required this.user,
        required this.musicAssetInfo,
    });

    double? x;
    double? y;
    int? z;
    double? width;
    double? height;
    double? rotation;
    int? isPinned;
    int? isHidden;
    String? displayType;
    int? isSticker;
    int? isFbSticker;
    UserElement? user;
    MusicAssetInfo? musicAssetInfo;

    factory ReelMention.fromJson(Map<String, dynamic> json) => ReelMention(
        x: json["x"] == null ? null : json["x"].toDouble(),
        y: json["y"] == null ? null : json["y"].toDouble(),
        z: json["z"],
        width: json["width"] == null ? null : json["width"].toDouble(),
        height: json["height"] == null ? null : json["height"].toDouble(),
        rotation: json["rotation"] == null ? null : json["rotation"].toDouble(),
        isPinned: json["is_pinned"],
        isHidden: json["is_hidden"],
        displayType: json["display_type"],
        isSticker: json["is_sticker"],
        isFbSticker: json["is_fb_sticker"],
        user: json["user"] == null ? null : UserElement.fromJson(json["user"]),
        musicAssetInfo: json["music_asset_info"] == null ? null : MusicAssetInfo.fromJson(json["music_asset_info"]),
    );

    Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
        "z": z,
        "width": width,
        "height": height,
        "rotation": rotation,
        "is_pinned": isPinned,
        "is_hidden": isHidden,
        "display_type": displayType,
        "is_sticker": isSticker,
        "is_fb_sticker": isFbSticker,
        "user": user == null ? null : user!.toJson(),
        "music_asset_info": musicAssetInfo == null ? null : musicAssetInfo!.toJson(),
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

    String? audioClusterId;
    String? id;
    String? title;
    dynamic sanitizedTitle;
    String? subtitle;
    String? displayArtist;
    dynamic artistId;
    String? coverArtworkUri;
    String? coverArtworkThumbnailUri;
    String? progressiveDownloadUrl;
    dynamic reactiveAudioDownloadUrl;
    String? fastStartProgressiveDownloadUrl;
    dynamic web30SPreviewDownloadUrl;
    List<int>? highlightStartTimesInMs;
    bool? isExplicit;
    String? dashManifest;
    bool? hasLyrics;
    String? audioAssetId;
    int? durationInMs;
    dynamic darkMessage;
    bool? allowsSaving;
    TerritoryValidityPeriods? territoryValidityPeriods;
    String? igUsername;
    UserElement? igArtist;
    String? placeholderProfilePicUrl;
    bool? shouldMuteAudio;
    String? shouldMuteAudioReason;
    dynamic shouldMuteAudioReasonType;
    bool? isBookmarked;
    int? overlapDurationInMs;
    int? audioAssetStartTimeInMs;
    bool? allowMediaCreationWithMusic;
    bool? isTrendingInClips;
    dynamic formattedClipsMediaCount;
    dynamic streamingServices;
    dynamic displayLabels;
    bool? shouldAllowMusicEditing;

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
        required this.username, // ? ÖNEMLİ
        required this.fullName,
        required this.isPrivate,
        required this.pkId,
        required this.profilePicUrl,
        required this.profilePicId,
        required this.isVerified,
        required this.friendshipStatus,
    });

    String? pk;
    String? username;
    String? fullName;
    bool? isPrivate;
    String? pkId;
    String? profilePicUrl;
    String? profilePicId;
    bool? isVerified;
    FriendshipStatus? friendshipStatus;

    factory UserElement.fromJson(Map<String, dynamic> json) => UserElement(
        pk: json["pk"],
        username: json["username"],
        fullName: json["full_name"],
        isPrivate: json["is_private"],
        pkId: json["pk_id"],
        profilePicUrl: json["profile_pic_url"],
        profilePicId: json["profile_pic_id"],
        isVerified: json["is_verified"],
        friendshipStatus: json["friendship_status"] == null ? null : FriendshipStatus.fromJson(json["friendship_status"]),
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
        "friendship_status": friendshipStatus == null ? null : friendshipStatus!.toJson(),
    };
}

class FriendshipStatus {
    FriendshipStatus({
        required this.muting,
        required this.isMutingReel,
        required this.following,
        required this.isBestie,
        required this.outgoingRequest,
    });

    bool muting;
    bool isMutingReel;
    bool following;
    bool isBestie;
    bool outgoingRequest;

    factory FriendshipStatus.fromJson(Map<String, dynamic> json) => FriendshipStatus(
        muting: json["muting"],
        isMutingReel: json["is_muting_reel"],
        following: json["following"],
        isBestie: json["is_bestie"],
        outgoingRequest: json["outgoing_request"],
    );

    Map<String, dynamic> toJson() => {
        "muting": muting,
        "is_muting_reel": isMutingReel,
        "following": following,
        "is_bestie": isBestie,
        "outgoing_request": outgoingRequest,
    };
}

class TerritoryValidityPeriods {
    TerritoryValidityPeriods();

    factory TerritoryValidityPeriods.fromJson(Map<String, dynamic> json) => TerritoryValidityPeriods(
    );

    Map<String, dynamic> toJson() => {
    };
}

class SharingFrictionInfo {
    SharingFrictionInfo({
        required this.shouldHaveSharingFriction,
        required this.bloksAppUrl,
        required this.sharingFrictionPayload,
    });

    bool shouldHaveSharingFriction;
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

class StoryAppAttribution {
    StoryAppAttribution({
        required this.appActionText,
        required this.appIconUrl,
        required this.contentUrl,
        required this.previewUrl,
        required this.id,
        required this.link,
        required this.name,
    });

    String appActionText;
    String appIconUrl;
    String contentUrl;
    String previewUrl;
    String id;
    String link;
    String name;

    factory StoryAppAttribution.fromJson(Map<String, dynamic> json) => StoryAppAttribution(
        appActionText: json["app_action_text"],
        appIconUrl: json["app_icon_url"],
        contentUrl: json["content_url"],
        previewUrl: json["preview_url"],
        id: json["id"],
        link: json["link"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "app_action_text": appActionText,
        "app_icon_url": appIconUrl,
        "content_url": contentUrl,
        "preview_url": previewUrl,
        "id": id,
        "link": link,
        "name": name,
    };
}

class StoryFeedMedia {
    StoryFeedMedia({
        required this.x,
        required this.y,
        required this.z,
        required this.width,
        required this.height,
        required this.rotation,
        required this.isPinned,
        required this.isHidden,
        required this.isSticker,
        required this.isFbSticker,
        required this.mediaId,
        required this.productType,
        required this.mediaCode,
        required this.clipsCreationEntryPoint,
    });

    double x;
    double y;
    int z;
    double width;
    double height;
    double rotation;
    int isPinned;
    int isHidden;
    int isSticker;
    int isFbSticker;
    String mediaId;
    String productType;
    String mediaCode;
    String? clipsCreationEntryPoint;

    factory StoryFeedMedia.fromJson(Map<String, dynamic> json) => StoryFeedMedia(
        x: json["x"] == null ? null : json["x"].toDouble(),
        y: json["y"] == null ? null : json["y"].toDouble(),
        z: json["z"],
        width: json["width"] == null ? null : json["width"].toDouble(),
        height: json["height"] == null ? null : json["height"].toDouble(),
        rotation: json["rotation"],
        isPinned: json["is_pinned"],
        isHidden: json["is_hidden"],
        isSticker: json["is_sticker"],
        isFbSticker: json["is_fb_sticker"],
        mediaId: json["media_id"],
        productType: json["product_type"],
        mediaCode: json["media_code"],
        clipsCreationEntryPoint: json["clips_creation_entry_point"],
    );

    Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
        "z": z,
        "width": width,
        "height": height,
        "rotation": rotation,
        "is_pinned": isPinned,
        "is_hidden": isHidden,
        "is_sticker": isSticker,
        "is_fb_sticker": isFbSticker,
        "media_id": mediaId,
        "product_type": productType,
        "media_code": mediaCode,
        "clips_creation_entry_point": clipsCreationEntryPoint,
    };
}

class PurpleUser {
    PurpleUser({
        required this.pk,
        required this.isPrivate,
    });

    String pk;
    bool isPrivate;

    factory PurpleUser.fromJson(Map<String, dynamic> json) => PurpleUser(
        pk: json["pk"],
        isPrivate: json["is_private"],
    );

    Map<String, dynamic> toJson() => {
        "pk": pk,
        "is_private": isPrivate,
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

    int type;
    int width;
    int height;
    String url;
    String id;

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

class RankerScores {
    RankerScores({
        required this.ptap,
        required this.fp,
        required this.vm,
    });

    double ptap;
    double fp;
    double vm;

    factory RankerScores.fromJson(Map<String, dynamic> json) => RankerScores(
        ptap: json["ptap"] == null ? null : json["ptap"].toDouble(),
        fp: json["fp"] == null ? null : json["fp"].toDouble(),
        vm: json["vm"] == null ? null : json["vm"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "ptap": ptap,
        "fp": fp,
        "vm": vm,
    };
}

enum ReelType { USER_REEL }

final reelTypeValues = EnumValues({
    "user_reel": ReelType.USER_REEL
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap;
        return reverseMap;
    }
}
