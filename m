Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF5A3A0B2E;
	Sat, 26 Sep 2026 20:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790453518; cv=none; b=PXUjqXloB9jQseiSHYnLSxqXiN6fv/btKBkPz9JDeWMsykj5oo/qWOy0UTIMzATCOtV6rHyMpqTlvwuPGCLOM/PecSXE3/YdUzBgzFNXxtbgoUoB2tdVYyyPDD3qktqXybsktMwNigtnMKPFSEa6mCxG6NWGjm1zVznIP69JNYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790453518; c=relaxed/simple;
	bh=U2vXcoyjbuEDV1rN+WkLDvhuZNVs8UnNjX/eoGFhfT8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qG8MaT7LP1CmMeB2/W3PgDaJB29yWJMwnGXMPwMwSPRlD22Kcj5yXLZRwO1Do2dHPu36vB4vk1JA5H/ypQHRXdj8aUCrPkh2Wver4bWmYQ7srdoDSp1VosT86prcl3oxUXDgfYZaYzoVMr15O4PYvOnhVZx3kkSCN6UBHjXzC+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SuK8Rxks; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SuK8Rxks"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E4FCC2BCB8;
	Sat, 26 Sep 2026 20:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790453517;
	bh=U2vXcoyjbuEDV1rN+WkLDvhuZNVs8UnNjX/eoGFhfT8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=SuK8Rxks3a2cNRd/0qnzX9FgEYCzlaxwkD5uTMfKDMpgc6Dq6G8O0K+nXlL+ICwDN
	 u35GXVHx2oR/BHVLj6JDPvhoEkxBg/doHrHNFmz2ujfjAGWfe1gMyM8ri33J08Om+B
	 sJ43+ZRPKyGt0QdisYvb6JKGsAZq8HluivCSuMBSlVygIOsAFx1D6t/GEJbmocLQE5
	 fEdhm1ys4tGhFWMxLbkBedtfBURubfEzFWgBeTL5Xy2nQ1FctsRgb+dJRSB8w9Q5AQ
	 N/6qjvMqX0rAqDcKi8kJMYsGd7w7OXNqP1kwMKvTuPrF5btZuibCObTkKPa4Q3kzxM
	 vRasNXKl1z9Bg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC76C98328;
	Sat, 26 Sep 2026 20:11:57 +0000 (UTC)
From: Alexei Solcanu via B4 Relay <devnull+alexei.solcanu.pm.me@kernel.org>
Subject: [PATCH v2 0/2] hwmon: (gpd-fan) Fix the second fan on duo boards,
 split Win 5 fans
Date: Sat, 26 Sep 2026 16:11:19 -0400
Message-Id: <20260926-gpd-fan-duo-auto-v2-0-0a2ea41ee3b5@pm.me>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NwQ6DIBAFf8XsudsAplp78j8aDyCr0kQhIKSN8
 d+L9t7jJPPmbRDIGwrwKDbwlEwwdskgLgX0k1xGQqMzg2CiYo244eg0DnJBHS3KuFq811xTQ4x
 Vuoc8c54G8z6Tz+7HIaoX9evROYzJhNX6z/mZ+OH9ySeOHEWjVFUzVZYlb918nQm6fd+/g6xiK
 r4AAAA=
X-Change-ID: 20260925-gpd-fan-duo-auto-871de9e006dc
To: Guenter Roeck <linux@roeck-us.net>, 
 Cryolitia PukNgae <cryolitia@uniontech.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Antheas Kapenekakis <lkml@antheas.dev>, 
 Alexei Solcanu <alexei.solcanu@pm.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790453516; l=1175;
 i=alexei.solcanu@pm.me; s=20260925; h=from:subject:message-id;
 bh=U2vXcoyjbuEDV1rN+WkLDvhuZNVs8UnNjX/eoGFhfT8=;
 b=4aUxpQwyWgzTqwd4eqmjPV5XEXt9JCitYLUqqz1SAZzYTHKuuDLGftdMCe97DUrL2SlsnqvRY
 2RmvIBAaOgTCTlgJru7O2AkB5KMMgoZWkAmKFZRF4r3Nncd+bbziO/w
X-Developer-Key: i=alexei.solcanu@pm.me; a=ed25519;
 pk=iK6ervbccknflfirBb6E4x7TaOyCpnoGd33gzfiNEeo=
X-Endpoint-Received: by B4 Relay for alexei.solcanu@pm.me/20260925 with
 auth_id=1064
X-Original-From: Alexei Solcanu <alexei.solcanu@pm.me>
Reply-To: alexei.solcanu@pm.me

Patch 1 fixes pwm1_enable=2 leaving the second fan at its last manual
duty cycle on boards using gpd_duo_drvdata. It is unchanged from v1 and
is still needed on the GPD Duo, and on kernels where the Win 5 uses the
Duo settings.

Patch 2 gives the GPD Win 5 its own board data, with one fan and pwm
channel per fan. The Win 5 had one channel because it was added using
the Duo's settings, which treat both fans as one.

Tested on a GPD Win 5 (G1618-05). Not tested on the GPD Duo.

---
Changes in v2:
- Add patch 2: register both fans on the GPD Win 5 (Guenter)
- Link to v1: https://patch.msgid.link/20260925-gpd-fan-duo-auto-v1-1-29bb670b3331@pm.me

---
Alexei Solcanu (2):
      hwmon: (gpd-fan) Reset both fans to automatic on duo boards
      hwmon: (gpd-fan) Register both fans on the GPD Win 5

 Documentation/hwmon/gpd-fan.rst |  14 ++--
 drivers/hwmon/gpd-fan.c         | 147 +++++++++++++++++++++++++++-------------
 2 files changed, 108 insertions(+), 53 deletions(-)
---
base-commit: 3cbb5f15e464583e59c8501a7085ec12b53e23ac
change-id: 20260925-gpd-fan-duo-auto-871de9e006dc

Best regards,
--  
Alexei Solcanu <alexei.solcanu@pm.me>


