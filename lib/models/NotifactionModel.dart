

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
    NotificationModel({
        required this.friendRequestStories,
        required this.counts,
        required this.lastChecked,
        required this.priorityStories,
        required this.newStories,
        required this.oldStories,
        required this.continuationToken,
        required this.subscription,
        required this.isLastPage,
        required this.partition,
        required this.nextMaxId,
        required this.autoLoadMoreEnabled,
        required this.paginationFirstRecordTimestamp,
        required this.filters,
        required this.status,
    });

    List<FriendRequestStory> ?friendRequestStories;
    Map<String, int> ?counts;
    double ?lastChecked;
    List<dynamic> ?priorityStories;
    List<Story> ?newStories;
    List<Story> ?oldStories;
    int ?continuationToken;
    dynamic subscription;
    bool ?isLastPage;
    Partition ?partition;
    String ?nextMaxId;
    bool? autoLoadMoreEnabled;
    double ?paginationFirstRecordTimestamp;
    List<dynamic> ?filters;
    String ?status;

    factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        friendRequestStories: json["friend_request_stories"] == null ? null : List<FriendRequestStory>.from(json["friend_request_stories"].map((x) => FriendRequestStory.fromJson(x))),
        counts: json["counts"] == null ? null : Map.from(json["counts"]).map((k, v) => MapEntry<String, int>(k, v)),
        lastChecked: json["last_checked"] == null ? null : json["last_checked"].toDouble(),
        priorityStories: json["priority_stories"] == null ? null : List<dynamic>.from(json["priority_stories"].map((x) => x)),
        newStories: json["new_stories"] == null ? null : List<Story>.from(json["new_stories"].map((x) => Story.fromJson(x))),
        oldStories: json["old_stories"] == null ? null : List<Story>.from(json["old_stories"].map((x) => Story.fromJson(x))),
        continuationToken: json["continuation_token"],
        subscription: json["subscription"],
        isLastPage: json["is_last_page"],
        partition: json["partition"] == null ? null : Partition.fromJson(json["partition"]),
        nextMaxId: json["next_max_id"],
        autoLoadMoreEnabled: json["auto_load_more_enabled"],
        paginationFirstRecordTimestamp: json["pagination_first_record_timestamp"] == null ? null : json["pagination_first_record_timestamp"].toDouble(),
        filters: json["filters"] == null ? null : List<dynamic>.from(json["filters"].map((x) => x)),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "friend_request_stories": friendRequestStories == null ? null : List<dynamic>.from(friendRequestStories!.map((x) => x.toJson())),
        "counts": counts == null ? null : Map.from(counts!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "last_checked": lastChecked,
        "priority_stories": priorityStories == null ? null : List<dynamic>.from(priorityStories!.map((x) => x)),
        "new_stories": newStories == null ? null : List<dynamic>.from(newStories!.map((x) => x.toJson())),
        "old_stories": oldStories == null ? null : List<dynamic>.from(oldStories!.map((x) => x.toJson())),
        "continuation_token": continuationToken,
        "subscription": subscription,
        "is_last_page": isLastPage,
        "partition": partition == null ? null : partition!.toJson(),
        "next_max_id": nextMaxId,
        "auto_load_more_enabled": autoLoadMoreEnabled,
        "pagination_first_record_timestamp": paginationFirstRecordTimestamp,
        "filters": filters == null ? null : List<dynamic>.from(filters!.map((x) => x)),
        "status": status,
    };
}

class FriendRequestStory {
    FriendRequestStory({
        required this.type,
        required this.storyType,
        required this.args,
        required this.counts,
        required this.pk,
    });

    int ?type;
    int ?storyType;
    FriendRequestStoryArgs ?args;
    Counts ?counts;
    String ?pk;

    factory FriendRequestStory.fromJson(Map<String, dynamic> json) => FriendRequestStory(
        type: json["type"],
        storyType: json["story_type"],
        args: json["args"] == null ? null : FriendRequestStoryArgs.fromJson(json["args"]),
        counts: json["counts"] == null ? null : Counts.fromJson(json["counts"]),
        pk: json["pk"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "story_type": storyType,
        "args": args == null ? null : args!.toJson(),
        "counts": counts == null ? null : counts!.toJson(),
        "pk": pk,
    };
}

class FriendRequestStoryArgs {
    FriendRequestStoryArgs({
        required this.users,
        required this.requestCount,
        required this.clicked,
        required this.profileId,
        required this.profileImage,
        required this.secondProfileId,
        required this.secondProfileImage,
        required this.profileImageDestination,
        required this.subText,
        required this.afCandidateId,
    });

    List<PurpleUser> ?users;
    int ?requestCount;
    bool? clicked;
    String? profileId;
    String ?profileImage;
    String? secondProfileId;
    String ?secondProfileImage;
    String ?profileImageDestination;
    String ?subText;
    String? afCandidateId;

    factory FriendRequestStoryArgs.fromJson(Map<String, dynamic> json) => FriendRequestStoryArgs(
        users: json["users"] == null ? null : List<PurpleUser>.from(json["users"].map((x) => PurpleUser.fromJson(x))),
        requestCount: json["request_count"],
        clicked: json["clicked"],
        profileId: json["profile_id"],
        profileImage: json["profile_image"],
        secondProfileId: json["second_profile_id"].toString(),
        secondProfileImage: json["second_profile_image"],
        profileImageDestination: json["profile_image_destination"],
        subText: json["sub_text"],
        afCandidateId: json["af_candidate_id"],
    );

    Map<String, dynamic> toJson() => {
        "users": users == null ? null : List<dynamic>.from(users!.map((x) => x.toJson())),
        "request_count": requestCount,
        "clicked": clicked,
        "profile_id": profileId,
        "profile_image": profileImage,
        "second_profile_id": secondProfileId,
        "second_profile_image": secondProfileImage,
        "profile_image_destination": profileImageDestination,
        "sub_text": subText,
        "af_candidate_id": afCandidateId,
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
        required this.hasHighlightReels,
        required this.accountBadges,
    });

    String ?pk;
    String ?username;
    String ?fullName;
    bool? isPrivate;
    String ?pkId;
    String ?profilePicUrl;
    String ?profilePicId;
    bool ?isVerified;
    bool ?hasAnonymousProfilePicture;
    bool ?hasHighlightReels;
    List<dynamic>? accountBadges;

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
        hasHighlightReels: json["has_highlight_reels"],
        accountBadges: json["account_badges"] == null ? null : List<dynamic>.from(json["account_badges"].map((x) => x)),
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
        "has_highlight_reels": hasHighlightReels,
        "account_badges": accountBadges == null ? null : List<dynamic>.from(accountBadges!.map((x) => x)),
    };
}

class Counts {
    Counts();

    factory Counts.fromJson(Map<String, dynamic> json) => Counts(
    );

    Map<String, dynamic> toJson() => {
    };
}

class Story {
    Story({
        required this.storyType,
        required this.type,
        required this.args,
        required this.counts,
        required this.pk,
    });

    int ?storyType;
    int ?type;
    NewStoryArgs? args;
    Counts? counts;
    String ?pk;

    factory Story.fromJson(Map<String, dynamic> json) => Story(
        storyType: json["story_type"],
        type: json["type"],
        args: json["args"] == null ? null : NewStoryArgs.fromJson(json["args"]),
        counts: json["counts"] == null ? null : Counts.fromJson(json["counts"]),
        pk: json["pk"],
    );

    Map<String, dynamic> toJson() => {
        "story_type": storyType,
        "type": type,
        "args": args == null ? null : args!.toJson(),
        "counts": counts == null ? null : counts!.toJson(),
        "pk": pk,
    };
}

class NewStoryArgs {
    NewStoryArgs({
        required this.destination,
        required this.richText,
        required this.profileId,
        required this.profileImage,
        required this.media,
        required this.images,
        required this.mediaDestination,
        required this.actions,
        required this.timestamp,
        required this.tuuid,
        required this.clicked,
        required this.afCandidateId,
        required this.profileName,
        required this.latestReelMedia,
        required this.text,
        required this.links,
        required this.users,
        required this.hasLikedComment,
        required this.displayUfi,
        required this.privateReplyStatus,
        required this.commentText,
        required this.friendshipStatus,
        required this.commentId,
        required this.commentIds,
        required this.inlineFollow,
        required this.iconImage,
        required this.iconColor,
        required this.iconUrl,
        required this.shouldIconApplyFilter,
        required this.iconShouldApplyFilter,
        required this.extra,
    });

    String ?destination;
    String ?richText;
    String? profileId;
    String ?profileImage;
    List<Image>? media;
    List<Image>? images;
    String? mediaDestination;
    List<Action>? actions;
    double? timestamp;
    String? tuuid;
    bool? clicked;
    String? afCandidateId;
    String? profileName;
    int ?latestReelMedia;
    String ?text;
    List<Link>? links;
    List<FluffyUser>? users;
    bool ?hasLikedComment;
    bool ?displayUfi;
    int ?privateReplyStatus;
    String ?commentText;
    FriendshipStatus? friendshipStatus;
    String ?commentId;
    List<String> ?commentIds;
    InlineFollow ?inlineFollow;
    dynamic iconImage;
    dynamic iconColor;
    String ?iconUrl;
    bool ?shouldIconApplyFilter;
    bool? iconShouldApplyFilter;
    Extra ?extra;

    factory NewStoryArgs.fromJson(Map<String, dynamic> json) => NewStoryArgs(
        destination: json["destination"],
        richText: json["rich_text"],
        profileId: json["profile_id"],
        profileImage: json["profile_image"],
        media: json["media"] == null ? null : List<Image>.from(json["media"].map((x) => Image.fromJson(x))),
        images: json["images"] == null ? null : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        mediaDestination: json["media_destination"],
        actions: json["actions"] == null ? null : List<Action>.from(json["actions"].map((x) => actionValues.map![x])),
        timestamp: json["timestamp"] == null ? null : json["timestamp"].toDouble(),
        tuuid: json["tuuid"],
        clicked: json["clicked"],
        afCandidateId: json["af_candidate_id"],
        profileName: json["profile_name"],
        latestReelMedia: json["latest_reel_media"],
        text: json["text"],
        links: json["links"] == null ? null : List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        users: json["users"] == null ? null : List<FluffyUser>.from(json["users"].map((x) => FluffyUser.fromJson(x))),
        hasLikedComment: json["has_liked_comment"],
        displayUfi: json["display_ufi"],
        privateReplyStatus: json["private_reply_status"],
        commentText: json["comment_text"],
        friendshipStatus: json["friendship_status"] == null ? null : FriendshipStatus.fromJson(json["friendship_status"]),
        commentId: json["comment_id"],
        commentIds: json["comment_ids"] == null ? null : List<String>.from(json["comment_ids"].map((x) => x)),
        inlineFollow: json["inline_follow"] == null ? null : InlineFollow.fromJson(json["inline_follow"]),
        iconImage: json["icon_image"],
        iconColor: json["icon_color"],
        iconUrl: json["icon_url"],
        shouldIconApplyFilter: json["should_icon_apply_filter"],
        iconShouldApplyFilter: json["icon_should_apply_filter"],
        extra: json["extra"] == null ? null : Extra.fromJson(json["extra"]),
    );

    Map<String, dynamic> toJson() => {
        "destination": destination,
        "rich_text": richText,
        "profile_id": profileId,
        "profile_image": profileImage,
        "media": media == null ? null : List<dynamic>.from(media!.map((x) => x.toJson())),
        "images": images == null ? null : List<dynamic>.from(images!.map((x) => x.toJson())),
        "media_destination": mediaDestination,
        "actions": actions == null ? null : List<dynamic>.from(actions!.map((x) => actionValues.reverse![x])),
        "timestamp": timestamp,
        "tuuid": tuuid,
        "clicked": clicked,
        "af_candidate_id": afCandidateId,
        "profile_name": profileName,
        "latest_reel_media": latestReelMedia,
        "text": text,
        "links": links == null ? null : List<dynamic>.from(links!.map((x) => x.toJson())),
        "users": users == null ? null : List<dynamic>.from(users!.map((x) => x.toJson())),
        "has_liked_comment": hasLikedComment,
        "display_ufi": displayUfi,
        "private_reply_status": privateReplyStatus,
        "comment_text": commentText,
        "friendship_status": friendshipStatus == null ? null : friendshipStatus!.toJson(),
        "comment_id": commentId,
        "comment_ids": commentIds == null ? null : List<dynamic>.from(commentIds!.map((x) => x)),
        "inline_follow": inlineFollow == null ? null : inlineFollow!.toJson(),
        "icon_image": iconImage,
        "icon_color": iconColor,
        "icon_url": iconUrl,
        "should_icon_apply_filter": shouldIconApplyFilter,
        "icon_should_apply_filter": iconShouldApplyFilter,
        "extra": extra == null ? null : extra!.toJson(),
    };
}

enum Action { HIDE, BLOCK, RESTRICT, REMOVE_FOLLOWER, DELETE_COMMENT }

final actionValues = EnumValues({
    "block": Action.BLOCK,
    "delete_comment": Action.DELETE_COMMENT,
    "hide": Action.HIDE,
    "remove_follower": Action.REMOVE_FOLLOWER,
    "restrict": Action.RESTRICT
});

class Extra {
    Extra({
        required this.lat,
        required this.long,
    });

    double ?lat;
    double ?long;

    factory Extra.fromJson(Map<String, dynamic> json) => Extra(
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        long: json["long"] == null ? null : json["long"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "long": long,
    };
}

class FriendshipStatus {
    FriendshipStatus({
        required this.isRestricted,
    });

    bool isRestricted;

    factory FriendshipStatus.fromJson(Map<String, dynamic> json) => FriendshipStatus(
        isRestricted: json["is_restricted"],
    );

    Map<String, dynamic> toJson() => {
        "is_restricted": isRestricted,
    };
}

class Image {
    Image({
        required this.id,
        required this.image,
        required this.commentThreadingEnabled,
    });

    String? id;
    String ?image;
    bool? commentThreadingEnabled;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        image: json["image"],
        commentThreadingEnabled: json["comment_threading_enabled"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "comment_threading_enabled": commentThreadingEnabled,
    };
}

class InlineFollow {
    InlineFollow({
        required this.userInfo,
        required this.following,
        required this.outgoingRequest,
        required this.incomingRequest,
    });

    UserInfo? userInfo;
    bool? following;
    bool? outgoingRequest;
    bool? incomingRequest;

    factory InlineFollow.fromJson(Map<String, dynamic> json) => InlineFollow(
        userInfo: json["user_info"] == null ? null : UserInfo.fromJson(json["user_info"]),
        following: json["following"],
        outgoingRequest: json["outgoing_request"],
        incomingRequest: json["incoming_request"],
    );

    Map<String, dynamic> toJson() => {
        "user_info": userInfo == null ? null : userInfo!.toJson(),
        "following": following,
        "outgoing_request": outgoingRequest,
        "incoming_request": incomingRequest,
    };
}

class UserInfo {
    UserInfo({
        required this.id,
        required this.username,
        required this.isPrivate,
        required this.profilePicUrl,
    });

    String ?id;
    String ?username;
    bool? isPrivate;
    String ?profilePicUrl;

    factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        id: json["id"],
        username: json["username"],
        isPrivate: json["is_private"],
        profilePicUrl: json["profile_pic_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "is_private": isPrivate,
        "profile_pic_url": profilePicUrl,
    };
}

class Link {
    Link({
        required this.start,
        required this.end,
        required this.type,
        required this.id,
    });

    int ?start;
    int ?end;
    Type? type;
    String ?id;

    factory Link.fromJson(Map<String, dynamic> json) => Link(
        start: json["start"],
        end: json["end"],
        type: json["type"] == null ? null : typeValues.map![json["type"]],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "start": start,
        "end": end,
        "type": type == null ? null : typeValues.reverse![type],
        "id": id,
    };
}

enum Type { USER }

final typeValues = EnumValues({
    "user": Type.USER
});

class FluffyUser {
    FluffyUser({
        required this.pk,
        required this.isVerified,
    });

    String? pk;
    bool? isVerified;

    factory FluffyUser.fromJson(Map<String, dynamic> json) => FluffyUser(
        pk: json["pk"],
        isVerified: json["is_verified"],
    );

    Map<String, dynamic> toJson() => {
        "pk": pk,
        "is_verified": isVerified,
    };
}

class Partition {
    Partition({
        required this.timeBucket,
    });

    TimeBucket? timeBucket;

    factory Partition.fromJson(Map<String, dynamic> json) => Partition(
        timeBucket: json["time_bucket"] == null ? null : TimeBucket.fromJson(json["time_bucket"]),
    );

    Map<String, dynamic> toJson() => {
        "time_bucket": timeBucket == null ? null : timeBucket!.toJson(),
    };
}

class TimeBucket {
    TimeBucket({
        required this.headers,
        required this.indices,
    });

    List<String>? headers;
    List<int> ?indices;

    factory TimeBucket.fromJson(Map<String, dynamic> json) => TimeBucket(
        headers: json["headers"] == null ? null : List<String>.from(json["headers"].map((x) => x)),
        indices: json["indices"] == null ? null : List<int>.from(json["indices"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "headers": headers == null ? null : List<dynamic>.from(headers!.map((x) => x)),
        "indices": indices == null ? null : List<dynamic>.from(indices!.map((x) => x)),
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
