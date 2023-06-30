
import 'dart:convert';

CommentsModel commentsModelFromJson(String str) => CommentsModel.fromJson(json.decode(str));

String commentsModelToJson(CommentsModel data) => json.encode(data.toJson());

class CommentsModel {
    CommentsModel({
        required this.commentLikesEnabled,
        required this.comments,
        required this.commentCount,
        required this.caption,
        required this.captionIsEdited,
        required this.hasMoreComments,
        required this.hasMoreHeadloadComments,
        required this.mediaHeaderDisplay,
        required this.initiateAtTop,
        required this.insertNewCommentToTop,
        required this.displayRealtimeTypingIndicator,
        required this.quickResponseEmojis,
        required this.previewComments,
        required this.canViewMorePreviewComments,
        required this.scrollBehavior,
        required this.commentCoverPos,
        required this.commentFilterParam,
        required this.status,
    });

    bool ?commentLikesEnabled;
    List<Comment> ?comments;
    int ?commentCount;
    Caption ?caption;
    bool ?captionIsEdited;
    bool ?hasMoreComments;
    bool ?hasMoreHeadloadComments;
    String ?mediaHeaderDisplay;
    bool? initiateAtTop;
    bool ?insertNewCommentToTop;
    bool ?displayRealtimeTypingIndicator;
    List<QuickResponseEmoji>? quickResponseEmojis;
    List<PreviewComment>? previewComments;
    bool ?canViewMorePreviewComments;
    int ?scrollBehavior;
    String ?commentCoverPos;
    String ?commentFilterParam;
    String? status;

    factory CommentsModel.fromJson(Map<String, dynamic> json) => CommentsModel(
        commentLikesEnabled: json["comment_likes_enabled"],
        comments: json["comments"] == null ? null : List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
        commentCount: json["comment_count"],
        caption: json["caption"] == null ? null : Caption.fromJson(json["caption"]),
        captionIsEdited: json["caption_is_edited"],
        hasMoreComments: json["has_more_comments"],
        hasMoreHeadloadComments: json["has_more_headload_comments"],
        mediaHeaderDisplay: json["media_header_display"],
        initiateAtTop: json["initiate_at_top"],
        insertNewCommentToTop: json["insert_new_comment_to_top"],
        displayRealtimeTypingIndicator: json["display_realtime_typing_indicator"],
        quickResponseEmojis: json["quick_response_emojis"] == null ? null : List<QuickResponseEmoji>.from(json["quick_response_emojis"].map((x) => QuickResponseEmoji.fromJson(x))),
        previewComments: json["preview_comments"] == null ? null : List<PreviewComment>.from(json["preview_comments"].map((x) => PreviewComment.fromJson(x))),
        canViewMorePreviewComments: json["can_view_more_preview_comments"],
        scrollBehavior: json["scroll_behavior"],
        commentCoverPos: json["comment_cover_pos"],
        commentFilterParam: json["comment_filter_param"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "comment_likes_enabled": commentLikesEnabled,
        "comments": comments == null ? null : List<dynamic>.from(comments!.map((x) => x.toJson())),
        "comment_count": commentCount,
        "caption": caption == null ? null : caption!.toJson(),
        "caption_is_edited": captionIsEdited,
        "has_more_comments": hasMoreComments,
        "has_more_headload_comments": hasMoreHeadloadComments,
        "media_header_display": mediaHeaderDisplay,
        "initiate_at_top": initiateAtTop,
        "insert_new_comment_to_top": insertNewCommentToTop,
        "display_realtime_typing_indicator": displayRealtimeTypingIndicator,
        "quick_response_emojis": quickResponseEmojis == null ? null : List<dynamic>.from(quickResponseEmojis!.map((x) => x.toJson())),
        "preview_comments": previewComments == null ? null : List<dynamic>.from(previewComments!.map((x) => x.toJson())),
        "can_view_more_preview_comments": canViewMorePreviewComments,
        "scroll_behavior": scrollBehavior,
        "comment_cover_pos": commentCoverPos,
        "comment_filter_param": commentFilterParam,
        "status": status,
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
        required this.hasTranslation,
        required this.privateReplyStatus,
    });

    String ?pk;
    String ?userId;
    String ?text;
    int ?type;
    int ?createdAt;
    int ?createdAtUtc;
    String ?contentType;
    String ?status;
    int ?bitFlags;
    bool ?didReportAsSpam;
    bool ?shareEnabled;
    User ?user;
    bool? isCovered;
    bool ?isRankedComment;
    bool? hasTranslation;
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
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        isCovered: json["is_covered"],
        isRankedComment: json["is_ranked_comment"],
        hasTranslation: json["has_translation"],
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
        "has_translation": hasTranslation,
        "private_reply_status": privateReplyStatus,
    };
}

class User {
    User({
        required this.pk,
        required this.username,
        required this.fullName,
        required this.isPrivate,
        required this.pkId,
        required this.profilePicUrl,
        required this.profilePicId,
        required this.isVerified,
        required this.isMentionable,
        required this.fanClubStatusSyncInfo,
        required this.latestReelMedia,
        required this.latestBestiesReelMedia,
    });

    String ?pk;
    String ?username;
    String ?fullName;
    bool ?isPrivate;
    String ?pkId;
    String? profilePicUrl;
    String? profilePicId;
    bool? isVerified;
    bool? isMentionable;
    FanClubStatusSyncInfo? fanClubStatusSyncInfo;
    int? latestReelMedia;
    int? latestBestiesReelMedia;

    factory User.fromJson(Map<String, dynamic> json) => User(
        pk: json["pk"],
        username: json["username"],
        fullName: json["full_name"],
        isPrivate: json["is_private"],
        pkId: json["pk_id"],
        profilePicUrl: json["profile_pic_url"],
        profilePicId: json["profile_pic_id"],
        isVerified: json["is_verified"],
        isMentionable: json["is_mentionable"],
        fanClubStatusSyncInfo: json["fan_club_status_sync_info"] == null ? null : FanClubStatusSyncInfo.fromJson(json["fan_club_status_sync_info"]),
        latestReelMedia: json["latest_reel_media"],
        latestBestiesReelMedia: json["latest_besties_reel_media"],
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
        "is_mentionable": isMentionable,
        "fan_club_status_sync_info": fanClubStatusSyncInfo == null ? null : fanClubStatusSyncInfo!.toJson(),
        "latest_reel_media": latestReelMedia,
        "latest_besties_reel_media": latestBestiesReelMedia,
    };
}

class FanClubStatusSyncInfo {
    FanClubStatusSyncInfo({
        required this.subscribed,
        required this.eligibleToSubscribe,
    });

    bool ?subscribed;
    bool ?eligibleToSubscribe;

    factory FanClubStatusSyncInfo.fromJson(Map<String, dynamic> json) => FanClubStatusSyncInfo(
        subscribed: json["subscribed"],
        eligibleToSubscribe: json["eligible_to_subscribe"],
    );

    Map<String, dynamic> toJson() => {
        "subscribed": subscribed,
        "eligible_to_subscribe": eligibleToSubscribe,
    };
}

class Comment {
    Comment({
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
        required this.inlineComposerDisplayCondition,
        required this.privateReplyStatus,
        required this.hasLikedComment,
        required this.commentLikeCount,
        required this.hasTranslation,
    });

    String ?pk;
    String ?userId;
    String ?text;
    int ?type;
    int ?createdAt;
    int ?createdAtUtc;
    String ?contentType;
    String ?status;
    int ?bitFlags;
    bool ?didReportAsSpam;
    bool ?shareEnabled;
    User ?user;
    bool ?isCovered;
    bool ?isRankedComment;
    String ?inlineComposerDisplayCondition;
    int ?privateReplyStatus;
    bool ?hasLikedComment;
    int ?commentLikeCount;
    bool ?hasTranslation;

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
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
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        isCovered: json["is_covered"],
        isRankedComment: json["is_ranked_comment"],
        inlineComposerDisplayCondition: json["inline_composer_display_condition"],
        privateReplyStatus: json["private_reply_status"],
        hasLikedComment: json["has_liked_comment"],
        commentLikeCount: json["comment_like_count"],
        hasTranslation: json["has_translation"],
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
        "inline_composer_display_condition": inlineComposerDisplayCondition,
        "private_reply_status": privateReplyStatus,
        "has_liked_comment": hasLikedComment,
        "comment_like_count": commentLikeCount,
        "has_translation": hasTranslation,
    };
}

class PreviewComment {
    PreviewComment({
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
        required this.hasLikedComment,
        required this.commentLikeCount,
        required this.privateReplyStatus,
    });

    String ?pk;
    String? userId;
    String? text;
    int? type;
    int? createdAt;
    int ?createdAtUtc;
    String ?contentType;
    String? status;
    int? bitFlags;
    bool? didReportAsSpam;
    bool ?shareEnabled;
    User? user;
    bool ?isCovered;
    bool ?isRankedComment;
    bool ?hasLikedComment;
    int ?commentLikeCount;
    int? privateReplyStatus;

    factory PreviewComment.fromJson(Map<String, dynamic> json) => PreviewComment(
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
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        isCovered: json["is_covered"],
        isRankedComment: json["is_ranked_comment"],
        hasLikedComment: json["has_liked_comment"],
        commentLikeCount: json["comment_like_count"],
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
        "has_liked_comment": hasLikedComment,
        "comment_like_count": commentLikeCount,
        "private_reply_status": privateReplyStatus,
    };
}

class QuickResponseEmoji {
    QuickResponseEmoji({
        required this.unicode,
    });

    String ?unicode;

    factory QuickResponseEmoji.fromJson(Map<String, dynamic> json) => QuickResponseEmoji(
        unicode: json["unicode"],
    );

    Map<String, dynamic> toJson() => {
        "unicode": unicode,
    };
}
