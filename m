Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8154A9D4A;
	Mon, 31 Aug 2026 15:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189083; cv=none; b=oyZVcAMqqSGiTgwqhroNZ/I9E3SxLYidXUK1Uhdr2io+WSj+98d7Vih1w467AaTXHJHUsYj5auG4CIW8awZhoAHWewBLWA0OYpQ+WqPQm9oPdjNqrX87YU3KI6nmq/XmaKaAnId/Ne51HEvYKsv4GeXFypTwm9kM3NpX5tVEVY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189083; c=relaxed/simple;
	bh=k3Sgh6jlp77nv2Q3n5CAW0/AQ3eATa8kbVi/iN+ImOs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cE4GINGXDTRMbLxWnnOepb9FuWMXB+Zbnu86b/i7iU+hYw5nBUtm15K2wH2UppocwFhizQS2E+QyhaoCUUP0UIGfLDqDZx18ig9MG7oJt/0GrQMohd01T9T2tzhwkc0MKJK9bdlcQ9RUperl9VZJnjsQxasst1ayFVlEnI2YBPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1788188979t91c88048
X-QQ-Originating-IP: Fn4x0VlqehPaklbz+wQwFxEwTCOqOl+DyOKnzBcXO4Y=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 31 Aug 2026 23:09:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14263417380129783316
EX-QQ-RecipientCnt: 13
From: Xilin Wu <sophon@radxa.com>
Subject: [PATCH 0/2] platform: arm64: Add Radxa SVC GLINK support
Date: Mon, 31 Aug 2026 23:09:31 +0800
Message-Id: <20260831-radxa-svc-v1-0-7c028de6a387@radxa.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrDWpkZS4ilhUOxgLpIM0EXdXL
 F/y8y8QCkwCTXZBoJOF1yWhyDNwk11GUuyTATUaXZeFCtZHq+R0ylvEATUZU1WQ+i3QwPF7td1
 vOfqZ3P4O4L4fcWj1Um0AAAA=
X-Change-ID: 20260831-radxa-svc-da22f20e6677
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1473; i=sophon@radxa.com;
 h=from:subject:message-id; bh=k3Sgh6jlp77nv2Q3n5CAW0/AQ3eATa8kbVi/iN+ImOs=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFlTZxqu7BbWZv78rurg8oPc/0VkvibMWvl/h3d0XaJ0e
 fVZw3bFjlIWBjEuBlkxRRaFeIa57JW5156KlerBzGFlAhnCwMUpABNZ/Inhf0ruYoPsjKDT6ZHh
 Wzl0gqa9et6gd63s4r4Ev0cLLL9WajEybC94onZAffGexZybXO8lJF/fNuN7kcaSqWqnhOaqTHj
 jygYA
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NU/rt4Hbrwsc3CMzbNKRyq2zJdUVSIpkDNebbfy8nk9O+vr6cXTb3T2D
	4aT7yZf/0YU6yrua/5Vahz5OfYCRn4y3iTHqeZCiV4Mt/uGOtrVyC/4VpgQJ4X9OsOvN3+T
	Wduy8DToRLM7YvNeD4AFnkrywyFme6OZyXhQr2eTbYnAuOOQ7RQIRDNEKs82nm6acndsE3S
	aBG7r18hJsC3ZEG1x40oQSoO0UmvZgsprn+iE/aZUBx6cCEJRkYTI41SFCyWMgeTgHFqpTz
	14N71l1XXXSm4TPzM4Y1TMG+9cVeJRBrgZ1a01NId097QBwqA424N6jDGTLa9EgEDV9nirH
	M7m858Mv1Z6fEOD9Cp0DWutUkgwf8w/z5GnlyzH64QFqSSkpPQI5ovMsBe0SEwRwf4W7Mu7
	ZPmbitaCzysTcj9kdBN2R4fF+DRTV0D0hsB45Py53zfH73NZmJydEciqOmptli+TOcyufkB
	6p6GnfCJTt9rFMk4m6OJ883Kphs2yS5SAtW1Jsv6pEZxQaa4EyII5CujTlnd5HSKKdWRTz1
	aUx70qfaGX1u0QHrFH/tpvQ11ALlFaAYSNr5DGxJGRaG68J3jZd2UGID2eFBJV64FJm5oSG
	3ZGv2Nn4kdMVmPF2acZko5Gi5xIwSWtvok8lvTHEFbjv2mJMxJVa8R2JQ9GWTmx7J8y/0by
	Um1Jvu8BBQLuJaidneShySGzB0v6vUCqF1tqYsoMMWU6cifLTuuhzgWDt7TDc2Vs1PUyXk4
	vrjes/qCtKsAubmacj4aNpJuj5xWoHZ6JIJYnYDSPeFbBBcrDnKvlAgVWl0XifsLsstpBP5
	yUrX+swVtMHH1rQsJh/KxtD/RfEdR9XRGzMqOEDxg4dppeVK2mg9Qc23nNC6jEiPv6cmqWd
	hwvjzEXJldiphB4+vcC/FKYimaiPOWNusrKsX6mU+t3BnYodQVViXhW4uzY2gXVxk4ZLhMO
	21sllSVUqM4J6WIs2EgSGFEeFev72qshR3I/EU+sC4S9thcQVHy3cd/Dtaw23GxTJ7mhZos
	Oa9fT40UB+Y5jlLp3yCfsf6pRGzKLdPDY1Ko57MwF+l9CsYF6nCxl3/FMO/5b5Cmg2klf5v
	wFD63KuKiau/0nJ82LmFc0=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

Hi,

Add support for the RADXA_SVC_ADSP_APPS firmware service found on
supported Radxa boards using Qualcomm SoCs.

The service provides fan control and optional temperature, voltage,
current, and power sensor readings. These functions are exposed through
the standard hwmon interface.

The firmware SET_PROFILE operation only selects a fan curve and does not
change the overall system performance profile. The quiet and performance
curves are therefore represented as automatic pwm1_enable modes instead of
using the platform_profile framework.

The first patch adds the rpmsg client and fan control support. The second
patch adds discovery and registration of the optional firmware sensors.

This series is tested on Radxa Dragon Q8B (SC8280XP).

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
Xilin Wu (2):
      platform: arm64: Add Radxa SVC GLINK driver
      platform: arm64: radxa-svc: Add hwmon sensors

 Documentation/hwmon/index.rst            |    1 +
 Documentation/hwmon/radxa-svc-glink.rst  |   41 +
 MAINTAINERS                              |    8 +
 drivers/platform/arm64/Kconfig           |   13 +
 drivers/platform/arm64/Makefile          |    1 +
 drivers/platform/arm64/radxa_svc_glink.c | 1205 ++++++++++++++++++++++++++++++
 6 files changed, 1269 insertions(+)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260831-radxa-svc-da22f20e6677

Best regards,
--  
Xilin Wu <sophon@radxa.com>

