Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A445936D50C;
	Thu, 15 Jan 2026 13:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768483405; cv=none; b=pjn+s0n8u/sp+XNrK8l5qlThFLtlFcr3Ghyo5PUOHypI6SpHDg6H/Cq+sErDXX0+SfXempO2xtLS3nG4T5xn4qTYdg005SOV5Dm4wkI8m5/yQCJnuwsYxrWexxIrfZRnsIwEZxXtvIxKuo4g9KwbrMEQmJ4yDoU/EequDPq81pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768483405; c=relaxed/simple;
	bh=SZtGRS7dRppDQPEKZC8TK6WCvUl88aMPOqDvuQTdkqY=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version:Content-Type; b=ca2J/OE1asJrKRR9obxsGmw4RziOZfAeM1R4EwGBITXNPXKnLbAoiSHCxQBSuNeiKgg8uttJtNfgWH72Dov6qds+rMdhIsqAE9xkjDnDoRipDKymzrexa/vEJVZnTBPqwE/X23aPXe/f0UvFxGV2S7bvFrF3X0z1tKZX91XK4hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=VV9SlneX; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="VV9SlneX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1768483390; bh=exlRvUYTWpNOuCV5ti43A/Ta8hu5FxOTHw5/5w1Y7f0=;
	h=From:To:Cc:Subject:Date;
	b=VV9SlneXWpw53ihHNNlfoUfQTHx0ewB9CghhyA5aN6QGVTq9rIOHk2Qmk12E2Ebb4
	 8TwObehK327ooaU3qXqJyIDQuabU+NDoJDoZ+D4XEUanplXFIDnyoRl/HXY8CJ/zSl
	 cAB3kvhQh5Y34yWcIq71VHaTbFiFw3L5ScNfeR6g=
Received: from localhost.localdomain ([223.166.246.160])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 5C83A4D1; Thu, 15 Jan 2026 21:23:08 +0800
X-QQ-mid: xmsmtpt1768483388tmv87xffb
Message-ID: <tencent_98E69D461A9CE773D3611822369100FE5A06@qq.com>
X-QQ-XMAILINFO: N9ZZIWuX/jP7aLGtL063S3MvxrWGA55ByKmFgTOPt3qt6kkcwxM4ECM7nLYqGS
	 pBuztQN1/iqSIa10xRhopIvlI53R0dGLwvJe0f+VhOwOPzFfts54j96QpAG6KIeCszgqt31XD5e7
	 JJc+kc6Ans2ezSL07TW31+FWDLLIznpr+YDR/eRHnX/ntYkvqE1UNzQps1EoEN5b5OpyPbBGTGEp
	 3Y1vCDb7m+W4Z19GWNtTRMZRNn9R0x8wVICKpgjLxZ1xryrbkIj5VslokeTUjPsc6OT/vPLjKU6q
	 AVySuXZdxyuEDv8UphvYKxBpfNTEkzWmRJsVfh8VRKty2uUhajb2lCYxpc/P071nMwjWk6AtN7Yp
	 jDEeaUNNGeP5VsLgzIfzNPDmopKiBivIYAaDcFmUlnVo0RCNFjfeB18XkISTyiGgBw/AMGID0bTw
	 15RtyQl3En/RiUbY14m0WHuGU8sei/KBmbYXzbCMMDebaf5+UwDLay0YLDLikSqWqKZahLb25A5d
	 JxbyUdxoY34SRnaTaxH3Kj5x5URlxoN6RpqUUXLUV3/fMIrP2qiIznOBTpXP3TddCzbzHtvSkBkg
	 hWxJClWGPmUd53hjqpqJBZLfEzGFTmHWzd2cVhkljTIZZTHv1gvNVtYZZjrGhujq7lIyh+yXcMpS
	 ckW0INvis5pFGfzGGiVbj9DPM+dPji0/ks+jhij7QN5S9TB+5CsU0U3QPjXQrAcQatvbtaeZaQEW
	 uvvLrt/IP70V8jpBd4bP2LHnzo6YKJ+JES7j7QWASP2IP/opBf5VmpqeDZaWlO9N44ntbYOVAsER
	 aNJqAezz5H1PYwXs7rjRKbMP6OrOZfTsF0wvrvm22INQF9VzooppT/oEi3vSKkPlRQ9aCtVXwm2Y
	 CoI8VSNTeiYpV0V1z5jC5+ZmXBumBh4ab3hJcgyU5fhKx4vGE+pHHEbc77cFIUONN/u3veHSxzgS
	 DM5+IOofe1jYfYkJgaJb/y9JQApC1UgZU1lGiTildxcafTi4JmAA6P5ogkezbmH32ePSawToeUKw
	 e+qUSe1Zt8U+j1er9i1tc0wud88t32f+Tq0QDGpPgP0O4cjITp5zgSKDEbNOROJkecbquHKlrKk9
	 PHaHH2/RYStdM+EXQUpOEo41/xFguyTLA5QWYdB+SIwGwza3cj3HtP5oCm1nxYwyGMYo7QSu7r6C
	 AlbhbUeZtVI9jdSQ==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Felix Gu <gu_0233@qq.com>
To: gu_0233@qq.com,
	Guenter Roeck <linux@roeck-us.net>,
	Ban Feng <kcfeng0@nuvoton.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] hwmon: Fix resource leaks for device_node
Date: Thu, 15 Jan 2026 21:22:41 +0800
X-OQ-MSGID: <20260115-hwmon-fixes-v1-0-f1caf19b71ec@qq.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260115-hwmon-fixes-3d29ded39dbf
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768482384; l=677; i=gu_0233@qq.com; h=from:subject:message-id; bh=SZtGRS7dRppDQPEKZC8TK6WCvUl88aMPOqDvuQTdkqY=; b=J2GhtG/C57ataEMReIrTluPRpTcbHRK3Z7VZkDKMlrgqI9PI61iX5grfmOPGMpg0NIR8Ih96L a/z/vKtKWUNDRuhVp8TMtMBEIrWGKvs6nyDBfYYZ6gCWrOyTE6JZIHF
X-Developer-Key: i=gu_0233@qq.com; a=ed25519; pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
Content-Transfer-Encoding: 8bit

When calling of_parse_phandle_with_args(), the caller is responsible
to call of_node_put() to release the reference of device node.
In current code, it does not release the reference, causing a resource leak.

Signed-off-by: Felix Gu <gu_0233@qq.com>
---
Felix Gu (2):
      hwmon: emc2305: Fix a resource leak in emc2305_of_parse_pwm_child
      hwmon: nct7353: Fix a resource leak in nct7363_present_pwm_fanin

 drivers/hwmon/emc2305.c | 1 +
 drivers/hwmon/nct7363.c | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: 9b7977f9e39b7768c70c2aa497f04e7569fd3e00
change-id: 20260115-hwmon-fixes-3d29ded39dbf

Best regards,
-- 
Felix Gu <gu_0233@qq.com>

