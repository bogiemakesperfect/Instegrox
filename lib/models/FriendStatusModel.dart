

import 'dart:convert';

FriendStatus friendStatusFromJson(String str) => FriendStatus.fromJson(json.decode(str));

String friendStatusToJson(FriendStatus data) => json.encode(data.toJson());

class FriendStatus {
    FriendStatus({
        required this.blocking,
        required this.followedBy,
        required this.following,
        required this.incomingRequest,
        required this.isBestie,
        required this.isBlockingReel,
        required this.isMutingReel,
        required this.isPrivate,
        required this.isRestricted,
        required this.muting,
        required this.outgoingRequest,
        required this.isFeedFavorite,
        required this.isSupervisedByViewer,
        required this.isGuardianOfViewer,
        required this.status,
    });

    bool ?blocking;
    bool ?followedBy;
    bool ?following;
    bool ?incomingRequest;
    bool ?isBestie;
    bool ?isBlockingReel;
    bool ?isMutingReel;
    bool ?isPrivate;
    bool ?isRestricted;
    bool ?muting;
    bool ?outgoingRequest;
    bool ?isFeedFavorite;
    bool ?isSupervisedByViewer;
    bool ?isGuardianOfViewer;
    String ?status;

    factory FriendStatus.fromJson(Map<String, dynamic> json) => FriendStatus(
        blocking: json["blocking"],
        followedBy: json["followed_by"],
        following: json["following"],
        incomingRequest: json["incoming_request"],
        isBestie: json["is_bestie"],
        isBlockingReel: json["is_blocking_reel"],
        isMutingReel: json["is_muting_reel"],
        isPrivate: json["is_private"],
        isRestricted: json["is_restricted"],
        muting: json["muting"],
        outgoingRequest: json["outgoing_request"],
        isFeedFavorite: json["is_feed_favorite"],
        isSupervisedByViewer: json["is_supervised_by_viewer"],
        isGuardianOfViewer: json["is_guardian_of_viewer"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "blocking": blocking,
        "followed_by": followedBy,
        "following": following,
        "incoming_request": incomingRequest,
        "is_bestie": isBestie,
        "is_blocking_reel": isBlockingReel,
        "is_muting_reel": isMutingReel,
        "is_private": isPrivate,
        "is_restricted": isRestricted,
        "muting": muting,
        "outgoing_request": outgoingRequest,
        "is_feed_favorite": isFeedFavorite,
        "is_supervised_by_viewer": isSupervisedByViewer,
        "is_guardian_of_viewer": isGuardianOfViewer,
        "status": status,
    };
}
