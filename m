Received: from e242-11.smtp-out.us-west-1.amazonses.com (e242-11.smtp-out.us-west-1.amazonses.com [23.251.242.11])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC2A175A72;
	Wed, 18 Mar 2026 07:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.242.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773817298; cv=none; b=XKUw1UEkLAdSaK3TGuMy8nAuOuBein/G8vP2+SJLSQ5XQj8cy9jDD3neRXgsLa04PLrD2qlfCGl6eZ/1xBXGKfzS+vEuChBQVH9Q2ppfrTKyWPMWJswXJyZRF+WnlR/RzGftUDLQUmTN1CNL/Quw5y8bysX9imkfOnnXiqhuYeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773817298; c=relaxed/simple;
	bh=09LSl1IjkmHBf8mV71JJJzNERuhqiOeb5UUbP7HCg50=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oh/d5sU9UrkOh+gI2cRdn4uz2JBZKwAj8yQUVsuku/E24oaXXE1HYzFL+G2DE0xM5+u4nyEVPMmLi7BSVvrCKh6Usxy3Gd7f94wPAoljfIlWmqE1dZi2vU+BkY5ub96ZvWHEHbWMka8cY6GMvS4ThYaDvzDKJOs/LZHTxmLi8jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=monolithicpower.com; spf=pass smtp.mailfrom=mail-mps-ses.monolithicpower.com; dkim=pass (2048-bit key) header.d=monolithicpower.com header.i=@monolithicpower.com header.b=FRiS6MAP; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=D9JJ7YUH; arc=none smtp.client-ip=23.251.242.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=monolithicpower.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail-mps-ses.monolithicpower.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monolithicpower.com header.i=@monolithicpower.com header.b="FRiS6MAP";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="D9JJ7YUH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rodjp4ft5fg4rp24cb2ntayvghblvgrq; d=monolithicpower.com;
	t=1773817297;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=09LSl1IjkmHBf8mV71JJJzNERuhqiOeb5UUbP7HCg50=;
	b=FRiS6MAPpaXonbSlKUXNq374yfiFg5aH43rTnVABgPAMk738R/2cefE9K5oiOsrC
	MuikkgxCD5QS/bFtsBEVN0ONIJP128AYjuRXy882fyYs2odqueQtxC3dDJX5zv1PYRA
	WplC5M7Yt6WpE4UK7dJ9KihFOohgPXGN+227v/+90aeu3iWwF1xP6+hXQFZ/vxqhRkh
	tuI7AewigL8LluosUjazhKoTicR/yHVwOlEzqsnSMm4ZzGxE0sUyVhsD7P8Z4H7OfO7
	pJpSyGvza55UqEqXz0dUbp8tUkhIwkwSzqyqBqI0cYKS27rZ5BTV0d8F5fTIJ7BeMNJ
	dia1r7XpzA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=voqdhibj3ww47nmt5hkqcrgg7xiynmza; d=amazonses.com; t=1773817297;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=09LSl1IjkmHBf8mV71JJJzNERuhqiOeb5UUbP7HCg50=;
	b=D9JJ7YUHDTVLJwwCVg0TWcuGnf8XIBxjdzV1/jKwTM0vfo8JJbS5ugSQe7sanFw6
	MFECqEACOd8A9zy5uipXv5HnCV1sK6bjnS1QuPqAc2qX85XlsT+QFYPYnGxnI0cRVUH
	eQlue95Sa5iwEyrMRmMI5eN795HmclINPNVr9hOY=
From: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
To: Yuxi.Wang@monolithicpower.com, linux@roeck-us.net, corbet@lwn.net, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: wyx137120466@gmail.com, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] hwmon: Add support for MPS mpm369x chip family
Date: Wed, 18 Mar 2026 07:01:36 +0000
Message-ID: <0111019cffbff6a6-a0442cd4-b306-4acf-92a1-987e86b10639-000000@us-west-1.amazonses.com>
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

Add mpm369x driver in hwmon and add dt-binding for it.

Yuxi Wang (2):
  dt-bindings: hwmon: Add mps mpm369x driver bindings
  hwmon: add mpm369x driver

 .../devicetree/bindings/trivial-devices.yaml  |   4 +
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/mpm369x.rst               |  75 ++++++++++++
 MAINTAINERS                                   |   7 ++
 drivers/hwmon/pmbus/Kconfig                   |   9 ++
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/mpm369x.c                 | 115 ++++++++++++++++++
 7 files changed, 212 insertions(+)
 create mode 100644 Documentation/hwmon/mpm369x.rst
 create mode 100644 drivers/hwmon/pmbus/mpm369x.c

-- 
2.39.2

