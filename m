Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA68742F54F
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Mar 2026 19:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772479739; cv=none; b=UVxSJOa/Tuc9qgm9MoJ7lx/Wu7PUgPTSeiMJ+awCVEQjjWFoksh5/t8t6ZKuSjm6+/3iZ9F2+Bp1SbAp0vWrUND/gg03X/GlGXkWO2FJAJY+t5mD4H0bRujWFejJCa8B+lUmBqW3DYLybDqqjuxseFqbdWWmlFf/hyDmQmOkvBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772479739; c=relaxed/simple;
	bh=mZ/Q+vv0qmCmKu/27AyDUC6pKRVvpS4aSqkxqx+1ZUk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PhOnHsCUXJwMyNX+o9dEh0DDy3mcfvEepqTmTWIhJnNidjEv45l/YVhBI2/7UrwIBaPKrsmn9XTp8P4GBOZ3qy32rUimLQ3ONX8onQxTWFc2Hqxj/oJr5DZ6QPHJR/b/StGwBZA1OVx1xODwV/ddNZm3J5bdYGXa+jhSGhmwIvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=turingtested.xyz; spf=pass smtp.mailfrom=turingtested.xyz; dkim=pass (2048-bit key) header.d=turingtested.xyz header.i=@turingtested.xyz header.b=n0Ziah9z; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=ZulBTiZ4; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=turingtested.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=turingtested.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=turingtested.xyz header.i=@turingtested.xyz header.b="n0Ziah9z";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="ZulBTiZ4"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=n0Ziah9zXtJ8jyAyZA0peM4wM/OBd1Sg7dtul5t4okxuEbNK0P0GZNZjW81bcFIXn/x/RlEZQtUkLYCCK8KUkbRVaAEG+eSLCRESX2+gxd+nutUe3h2wcbd6+cpv8evCQ1B6rJKNabjmHf9KJ65qFPYHrqtwbnsEwoSahs+wuBAA70w/dNr8Oa/HcG0wyl8R2B8PUA4ubNhTqp/zDMlUUrB9t5VizWQnO+j5mUjQBRebOqaQE6kL14WKMrHZK46Ibmkni3fYD+AYUOCt+QsT7LmjmREJzia+VExaZQrW7yWOO3DDc3VltUSgHwBLiXKPmvKYUDL2fG6Zhwk4ImXarw==; s=purelymail3; d=turingtested.xyz; v=1; bh=mZ/Q+vv0qmCmKu/27AyDUC6pKRVvpS4aSqkxqx+1ZUk=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=ZulBTiZ4mqkqO+KCm36Wn3HAdKGYdplgyURIhLu1RAixH0GYlsP49QVpXASvql0ASQionhEu7px//NRLIRaYJJaXIMBYz1ATrew2iQz61SdubuT/V3S0LjZQDHUNzGDqaEgpHa/e28+1HisCIhtjQLx2OLPNSAK0ILPrp8nSLVXs79FqVnhl5GxSQk5ANbjpbo806xjfXZZeRCS9j+HjrtM3VZKkr9P25pls/Q21O8ZeOohSpr+lRCZBCnl8tXP9Os9cieq6AoK06Wi0psP33Fw/xY61UKZOyM/fC7RVd7d66jsVB4Qbb7XSL1t23OjmIG2pBs7iOUaB3tuw9QMP+w==; s=purelymail3; d=purelymail.com; v=1; bh=mZ/Q+vv0qmCmKu/27AyDUC6pKRVvpS4aSqkxqx+1ZUk=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 591296:32372:null:purelymail
X-Pm-Original-To: linux-hwmon@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -8130386;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 02 Mar 2026 19:28:55 +0000 (UTC)
From: Amay Agarwal <tt@turingtested.xyz>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net,
	linux-kernel@vger.kernel.org,
	Amay Agarwal <tt@turingtested.xyz>
Subject: [PATCH 0/5] hwmon: Replace sprintf() with sysfs_emit()
Date: Tue,  3 Mar 2026 00:58:10 +0530
Message-ID: <20260302192813.10625-3-tt@turingtested.xyz>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

This series of commits replaces sprintf() with sysfs_emit() in the code
for several drivers (tc74, max31722, ads7828, max6659, emc1403) and=20
helps avoid potential buffer overflows.

Amay Agarwal (5):
  hwmon: tc74: use sysfs_emit() instead of sprintf()
  hwmon: max31722: use sysfs_emit() instead of sprintf()
  hwmon: ads7828: use sysfs_emit() instead of sprintf()
  hwmon: max6650: use sysfs_emit() instead of sprintf()
  hwmon: emc1403: use sysfs_emit() instead of sprintf()

 drivers/hwmon/ads7828.c  | 2 +-
 drivers/hwmon/emc1403.c  | 2 +-
 drivers/hwmon/max31722.c | 3 ++-
 drivers/hwmon/max6650.c  | 3 ++-
 drivers/hwmon/tc74.c     | 2 +-
 5 files changed, 7 insertions(+), 5 deletions(-)

Thank you,
Amay
