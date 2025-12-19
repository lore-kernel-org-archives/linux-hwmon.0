Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19BE3590B3
	for <linux-hwmon@vger.kernel.org>; Fri, 19 Dec 2025 16:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766160628; cv=none; b=NLFEXEc93MnNWALzVt+daNs+P3CHsN3wt8OfG2yjOupRWfWPuQohiQT8pm2Y9Jiz7WbFIY+/22bDvYxhRIjHFU6rBYKxUadmbwSlqvGVatgUJ/jYJO0rAo96yLD1NHCiP8oyUjjV424QbaOH7li3TwiMdg//SpdGMTlmfaNWrvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766160628; c=relaxed/simple;
	bh=zV1s6g2/OKB0kGEkWsKNIsn7x72ErEHTSpwM+SWxOmk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mDZAk1HAzeKHYahVR0N7vE6rFq5LkQ2GNY0gnbi61ptG9lDbjbTR62RZ8tzHp9IBbpYCen+5u7WXb+gEXgcJTygK6GSVh2onUvKJ/ttup3QpXTPsrlTTPe6mYjcxN+CiQsY5ujo4hLhcR7p55HHTTvKiucZyXw/+IMgvd3eK7Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FVXdnoZb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FVXdnoZb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F93FC4CEF1;
	Fri, 19 Dec 2025 16:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766160627;
	bh=zV1s6g2/OKB0kGEkWsKNIsn7x72ErEHTSpwM+SWxOmk=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=FVXdnoZbzEOSKKvLCzxi4c13c/PGVKGb+Kt9CPm2gR2Q+Q2udWKSkI0FRT7VwRw1g
	 jL/ZpJ7pjvJLFValzJP/cQ83/Hpkm35/8tHgfpoBp39pjl0yjEwPR6Cyaxw29Et+jG
	 FSGwM25HjbPtDp6RH8A3d57jn9VVnDPjlQPdqjIru2CA96Sre0N7/DTUVwDWnZ8xu/
	 J+efaahzsgFQlFpDmHlNfu4cYxXqEJ89lm7W2CckNMP+ImMaXgVp0h9TepoAWHWoYu
	 k92QDLKiba5ZNbYGxJbkg1TuRgWoZ/ycJgDQJogOT1Vfpnzv/1nk+vHf/RY5nqhred
	 c57Kx+fSpF0cA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E30AD78793;
	Fri, 19 Dec 2025 16:10:27 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Date: Fri, 19 Dec 2025 16:11:05 +0000
Subject: [PATCH] hwmon: (ltc4282): Fix reset_history file permissions
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251219-ltc4282-fix-reset-history-v1-1-8eab974c124b@analog.com>
X-B4-Tracking: v=1; b=H4sIABh5RWkC/x2MwQrCMBAFf6Xs2QWzNKD+SvFgkxe7IG3ZDaKE/
 rvB48DMNHKYwuk2NDK81XVbO4TTQGl5rE+w5s4kZ4lBwpVfNY1yES76YYOj8qJeN/tyjnMsOQm
 QQL3fDV36v6f7cfwAycCqYmsAAAA=
X-Change-ID: 20251219-ltc4282-fix-reset-history-d5b5fdc2eece
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766160668; l=1481;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=bBccOajjH8w1tZnRXp2xS8mA63Q2/GvTMzjF/7BuoN8=;
 b=zMabgTWThZvax76u5+L1rcldqLZbTw22eZA8G3stO3MVCb/3R4EgBkBOv5Wz9wkDvjhfCHWEr
 ZeZtlka/ZycA54fEkIhY2P+mslph5ALIsQo4n/3hUOuskecj9vhtEoR
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sá <nuno.sa@analog.com>

The reset_history attributes are write only. Hence don't report them as
readable just to return -EOPNOTSUPP later on.

Fixes: cbc29538dbf7 ("hwmon: Add driver for LTC4282")
Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/hwmon/ltc4282.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/ltc4282.c b/drivers/hwmon/ltc4282.c
index b9cad89f2cd9..db6534e67991 100644
--- a/drivers/hwmon/ltc4282.c
+++ b/drivers/hwmon/ltc4282.c
@@ -1000,8 +1000,9 @@ static umode_t ltc4282_in_is_visible(const struct ltc4282_state *st, u32 attr)
 	case hwmon_in_max:
 	case hwmon_in_min:
 	case hwmon_in_enable:
-	case hwmon_in_reset_history:
 		return 0644;
+	case hwmon_in_reset_history:
+		return 0200;
 	default:
 		return 0;
 	}
@@ -1020,8 +1021,9 @@ static umode_t ltc4282_curr_is_visible(u32 attr)
 		return 0444;
 	case hwmon_curr_max:
 	case hwmon_curr_min:
-	case hwmon_curr_reset_history:
 		return 0644;
+	case hwmon_curr_reset_history:
+		return 0200;
 	default:
 		return 0;
 	}
@@ -1039,8 +1041,9 @@ static umode_t ltc4282_power_is_visible(u32 attr)
 		return 0444;
 	case hwmon_power_max:
 	case hwmon_power_min:
-	case hwmon_power_reset_history:
 		return 0644;
+	case hwmon_power_reset_history:
+		return 0200;
 	default:
 		return 0;
 	}

---
base-commit: 1d9d442ab179b11c629ae8f87533c9ae381cc15f
change-id: 20251219-ltc4282-fix-reset-history-d5b5fdc2eece
--

Thanks!
- Nuno Sá


