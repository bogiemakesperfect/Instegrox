// To parse this JSON data, do
//
//     final userSearchsonuc = userSearchsonucFromJson(jsonString);
import 'dart:convert';

UserSearchsonuc userSearchsonucFromJson(String str) => UserSearchsonuc.fromJson(json.decode(str));

String userSearchsonucToJson(UserSearchsonuc data) => json.encode(data.toJson());

class UserSearchsonuc {
    UserSearchsonuc({
        required this.numResults,
        required this.users,
        required this.hasMore,
        required this.rankToken,
        required this.status,
    });

    int? numResults;
    List<User>? users;
    bool? hasMore;
    String? rankToken;
    String? status;

    factory UserSearchsonuc.fromJson(Map<String, dynamic> json) => UserSearchsonuc(
        numResults: json["num_results"],
        users: json["users"] == null ? null : List<User>.from(json["users"].map((x) => User.fromJson(x))),
        hasMore: json["has_more"],
        rankToken: json["rank_token"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "num_results": numResults,
        "users": users == null ? null : List<dynamic>.from(users!.map((x) => x.toJson())),
        "has_more": hasMore,
        "rank_token": rankToken,
        "status": status,
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
        required this.hasAnonymousProfilePicture,
        required this.hasHighlightReels,
        required this.hasOptEligibleShop,
        required this.accountBadges,
        required this.socialContext,
        required this.searchSocialContext,
        required this.friendshipStatus,
        required this.latestReelMedia,
        required this.liveBroadcastId,
        required this.shouldShowCategory,
        required this.reelAutoArchive,
        required this.allowedCommenterType,
        //required this.interopMessagingUserFbid,
        required this.fbidV2,
        required this.linkedFbInfo,
    });

    String? pk;
    String? username;
    String? fullName;
    bool? isPrivate;
    String? pkId;
    String? profilePicUrl;
    String? profilePicId;
    bool? isVerified;
    bool? hasAnonymousProfilePicture;
    bool? hasHighlightReels;
    bool? hasOptEligibleShop;
    List<dynamic>? accountBadges;
    String? socialContext;
    String? searchSocialContext;
    FriendshipStatus? friendshipStatus;
    int? latestReelMedia;
    dynamic liveBroadcastId;
    bool? shouldShowCategory;
    String? reelAutoArchive;
    String? allowedCommenterType;
    //int interopMessagingUserFbid;
    String? fbidV2;
    LinkedFbInfo? linkedFbInfo;

    factory User.fromJson(Map<String, dynamic> json) => User(
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
        hasOptEligibleShop: json["has_opt_eligible_shop"],
        accountBadges: json["account_badges"] == null ? null : List<dynamic>.from(json["account_badges"].map((x) => x)),
        socialContext: json["social_context"],
        searchSocialContext: json["search_social_context"],
        friendshipStatus: json["friendship_status"] == null ? null : FriendshipStatus.fromJson(json["friendship_status"]),
        latestReelMedia: json["latest_reel_media"],
        liveBroadcastId: json["live_broadcast_id"],
        shouldShowCategory: json["should_show_category"],
        reelAutoArchive: json["reel_auto_archive"],
        allowedCommenterType: json["allowed_commenter_type"],
        //interopMessagingUserFbid: json["interop_messaging_user_fbid"],
        fbidV2: json["fbid_v2"],
        linkedFbInfo: json["linked_fb_info"] == null ? null : LinkedFbInfo.fromJson(json["linked_fb_info"]),
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
        "has_opt_eligible_shop": hasOptEligibleShop,
        "account_badges": accountBadges == null ? null : List<dynamic>.from(accountBadges!.map((x) => x)),
        "social_context": socialContext,
        "search_social_context": searchSocialContext,
        "friendship_status": friendshipStatus == null ? null : friendshipStatus!.toJson(),
        "latest_reel_media": latestReelMedia,
        "live_broadcast_id": liveBroadcastId,
        "should_show_category": shouldShowCategory,
        "reel_auto_archive": reelAutoArchive,
        "allowed_commenter_type": allowedCommenterType,
       // "interop_messaging_user_fbid": interopMessagingUserFbid,
        "fbid_v2": fbidV2,
        "linked_fb_info": linkedFbInfo == null ? null : linkedFbInfo!.toJson(),
    };
}

class FriendshipStatus {
    FriendshipStatus({
        required this.following,
        required this.isPrivate,
        required this.incomingRequest,
        required this.outgoingRequest,
        required this.isBestie,
        required this.isRestricted,
        required this.isFeedFavorite,
    });

    bool? following;
    bool? isPrivate;
    bool? incomingRequest;
    bool? outgoingRequest;
    bool? isBestie;
    bool? isRestricted;
    bool? isFeedFavorite;

    factory FriendshipStatus.fromJson(Map<String, dynamic> json) => FriendshipStatus(
        following: json["following"],
        isPrivate: json["is_private"],
        incomingRequest: json["incoming_request"],
        outgoingRequest: json["outgoing_request"],
        isBestie: json["is_bestie"],
        isRestricted: json["is_restricted"],
        isFeedFavorite: json["is_feed_favorite"],
    );

    Map<String, dynamic> toJson() => {
        "following": following,
        "is_private": isPrivate,
        "incoming_request": incomingRequest,
        "outgoing_request": outgoingRequest,
        "is_bestie": isBestie,
        "is_restricted": isRestricted,
        "is_feed_favorite": isFeedFavorite,
    };
}

class LinkedFbInfo {
    LinkedFbInfo({
        required this.linkedFbUser,
    });

    LinkedFbUser? linkedFbUser;

    factory LinkedFbInfo.fromJson(Map<String, dynamic> json) => LinkedFbInfo(
        linkedFbUser: json["linked_fb_user"] == null ? null : LinkedFbUser.fromJson(json["linked_fb_user"]),
    );

    Map<String, dynamic> toJson() => {
        "linked_fb_user": linkedFbUser == null ? null : linkedFbUser!.toJson(),
    };
}

class LinkedFbUser {
    LinkedFbUser({
        required this.id,
        required this.name,
        required this.isValid,
        required this.fbAccountCreationTime,
        required this.linkTime,
    });

    String ?id;
    String? name;
    bool? isValid;
    dynamic fbAccountCreationTime;
    dynamic linkTime;

    factory LinkedFbUser.fromJson(Map<String, dynamic> json) => LinkedFbUser(
        id: json["id"],
        name: json["name"],
        isValid: json["is_valid"],
        fbAccountCreationTime: json["fb_account_creation_time"],
        linkTime: json["link_time"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "is_valid": isValid,
        "fb_account_creation_time": fbAccountCreationTime,
        "link_time": linkTime,
    };
}
