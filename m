Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71391E835B
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Jun 2025 16:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749659165; cv=none; b=hdJdcGtqnx+dtzd11JvlVbudRs2DyIHrV4bvhgLi1dI/cj6buSyQ/TIriH/dcKsEaqa6GtCcgfsOqD9iNRWs3fMWz+mYFVZj/oSzF8Mq7KhdOYxW61MDlSx1bd6X1hYjutegSm/67xpQtlGEMhyKHE7RbZC0VPY1HyoTfTVKKZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749659165; c=relaxed/simple;
	bh=4qoIdVZqskHdh9gXoHDe3uhAq3b9ORl/KtK3XxjIt68=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uklvGRLYMN2NwbqepmUgGuDP9qqiipScP/LuLCcqta/7Ng4uWxYFWwDRtvmCajGsObTl06jH2mQLLi3Pq1+OWn7WXcLugs/FYiMvQsb7N6bHvS+s6cHjtdN8UMNueDcG/ZZyFVPIYVgj7QwaKVw4/YHsbJBKBvkp/JD2u5cW6LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bmIX0qct; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bmIX0qct"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F9D6C4CEE3;
	Wed, 11 Jun 2025 16:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749659165;
	bh=4qoIdVZqskHdh9gXoHDe3uhAq3b9ORl/KtK3XxjIt68=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=bmIX0qctqJlFfADSDxJ7bldR+UYkA9ACDYf1j6nFwyOtOPy5WAtg0YqA4dICAo37+
	 qFLyKJWYlUPzmhvO3uzYmIPSlVlXCD3zmEVQoDl9YbUEehsCzqM/vcnMtyVzYrB/4O
	 gC0vf/UqeO0rDetMj5mrJEcjwf0JwiiS9F1PMtd09ov4m5Jo+Mu9M5rXTA2JcSWS7I
	 k2eGpQz8dBA0LBYvtnM9BdYuzEnuiuIFuLc+nvWJ5NIrDVMN0DCfdkPRo5xi/tXHy+
	 Ttd1mX02nVgmn8PPUPlnpRKZnWPwPiUlTOhkLW8TSlQYPh80MWB7DTLsuYJJx0CS4h
	 ccLcX8KaoRfEA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74EDCC71131;
	Wed, 11 Jun 2025 16:26:05 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Subject: [PATCH 0/2] hwmon: ltc4282: small fixes
Date: Wed, 11 Jun 2025 17:26:11 +0100
Message-Id: <20250611-fix-ltc4282-repetead-write-v1-0-fe46edd08cf1@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACOuSWgC/x3MQQrCMBBG4auUWTswnaoEr1JchPSPDkgtk9AWS
 u9ucPnB4x1U4IZCj+4gx2rFvnNDf+koveP8AtvUTCp6k7soZ9v5U9NVg7JjQUWceHOr4CBJVGL
 ucxioDRZHq//z8XmeP98dWsZsAAAA
X-Change-ID: 20250602-fix-ltc4282-repetead-write-80c020af1f83
To: linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749659172; l=443;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=4qoIdVZqskHdh9gXoHDe3uhAq3b9ORl/KtK3XxjIt68=;
 b=73msCQlKQtx9+rG7Ftg6n3wZIVtb0TxjARxVIqZsFEe2RW9vlPmnHdyMLQiB20Xlu94CqkFmT
 7Vi+/FNXUrLBpe3EVFfqcS2iyy8S+vvSGZht/qL8RGASsu9HawM/hiK
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

Simple series fixing a repeated register write and bad variable name.

---
Nuno Sá (2):
      hwmon: ltc4282: avoid repeated register write
      hwmon: ltc4282: fix copy past on variable name

 drivers/hwmon/ltc4282.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)
---
base-commit: 4f89db249aab8c9887821b54e1571408e65246f2
change-id: 20250602-fix-ltc4282-repetead-write-80c020af1f83
--

Thanks!
- Nuno Sá


