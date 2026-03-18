Received: from e242-11.smtp-out.us-west-1.amazonses.com (e242-11.smtp-out.us-west-1.amazonses.com [23.251.242.11])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1F13A963C;
	Wed, 18 Mar 2026 09:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.242.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773827245; cv=none; b=IC+IaUco9ltE2sp60mLpjDI60XWkqZD0rVaJlI6bUmMQqQ6SmwIPCpD+rDJLH+C8peofdsKShd7dDBLRVkBir0AsaEJVR8JYg8ZhBK62t+B8Ff4OTTuwUT0e3OtzWIMQdhYEfjq2JDX8OtQKXxma8KFu6PwK6S7cDKQbR4T4Ons=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773827245; c=relaxed/simple;
	bh=r0VR3DyjO0s0B6aDJEVN+h9UZ4+Ffd6p+VTidCZg4YA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uhj20jPLqIynMKEuxQsmfcDI/X4orjIiFYfFyOBrInh+ulJCGEP+x1fuO0QYWZXLpMsPGym7jmlCQ4bClZDc/0eWbsHGfSRTM9yMdlkzY0YxDqr8B7O1mqGWTh8LIAP7XWHnX3hh+/HEwN9rOk/wReyCsRG+y/b2QU+sG5z9lnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=monolithicpower.com; spf=pass smtp.mailfrom=mail-mps-ses.monolithicpower.com; dkim=pass (2048-bit key) header.d=monolithicpower.com header.i=@monolithicpower.com header.b=bNMG1Lua; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=kNw7haEI; arc=none smtp.client-ip=23.251.242.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=monolithicpower.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail-mps-ses.monolithicpower.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monolithicpower.com header.i=@monolithicpower.com header.b="bNMG1Lua";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="kNw7haEI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rodjp4ft5fg4rp24cb2ntayvghblvgrq; d=monolithicpower.com;
	t=1773827237;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=r0VR3DyjO0s0B6aDJEVN+h9UZ4+Ffd6p+VTidCZg4YA=;
	b=bNMG1LuaeGSH4AiQXcPYqmWtgOo4pPIJG35y4O4a6TFrHfHhJeBwfuwS+VXhoY9Q
	HZUfh8i0qi2us1wZWU2w3zY28cvFh7PtyxetbmzYs5/iWibNrfNY3G/BLseBjHYUJ2g
	sAuQBLgIl17D4WakcFEgE7e8HTgKOJfMfSHbCdKXNZYpMllWm6GaEzNNLBeSoRxZeth
	2vSwiYZCGqAmZ94JI3Zaj3b4UTJNg0DN5n2+OuqNBx4AHFdvXJRIadURYH6/fHJ+v4p
	riYlBrA8WlPewI9T4YoF/cTW4nm83QYSHj3TivaSXxW6RbOkA8+VxNsiJEza3R/QkEJ
	2ki7GWvkPQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=voqdhibj3ww47nmt5hkqcrgg7xiynmza; d=amazonses.com; t=1773827237;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=r0VR3DyjO0s0B6aDJEVN+h9UZ4+Ffd6p+VTidCZg4YA=;
	b=kNw7haEI/sv6i/fs0Z0DjPIxM+Jlf1fLNMsUQYSDXMbPc57/d2pVEFpKqquzxodf
	l1Z9AcL5BzWxP240vJ7MPUSdbGmSemdpmgUzlTeQgZbEk/+uPK9x5l+oQqxLH41AU7V
	pP1SF8rVKR8ISb6HIpTkn8KMrf9u736CyJ3OB7W4=
From: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
To: Yuxi.Wang@monolithicpower.com, linux@roeck-us.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, paweldembicki@gmail.com, 
	carl.lee@amd.com, ythsu0511@gmail.com
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, wyx137120466@gmail.com
Subject: [PATCH 0/2] hwmon: pmbus: Add support for mpm3695-20 and mpm3690s-15
Date: Wed, 18 Mar 2026 09:47:17 +0000
Message-ID: <0111019d0057a612-70585e60-1d6a-460c-8fae-d5bd16fc5e4f-000000@us-west-1.amazonses.com>
X-Mailer: git-send-email 2.51.0.windows.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: :1.us-west-1.CVpA5H5M7EMrIGr0u6+8nP6wkCH59pkYLxtNQh1UjuczBtN1WmV60RtUapmzBbQ7+P+SiHg5vbyEpY0uRvudPF12wRQI7xDHNKjWPMJN/yd9hVbV9UslJ09o7rVZZCRhPDXT8kPM9Nch5RQcZE90uz62B8giHS2hgInWMbQKX5A=:1.us-west-1.yP6/L6iaxFc47BvsTr22yvAX3nKjbzwVEN8jceuJEpw=:AmazonSES
X-SES-Outgoing: 2026.03.18-23.251.242.11

Add support for mpm3695-20 and mpm3690s-15 in mpq8785 driver.

Yuxi Wang (2):
  dt-bindings: hwmon: pmbus: mpq8785: add mpm3695-20 and mpm3690s-15
    support
  hwmon: pmbus: mpq8785: add support for mpm3695-20 and mpm3690s-15

 .../devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml   |  2 ++
 drivers/hwmon/pmbus/mpq8785.c                          | 10 +++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

-- 
2.39.2

