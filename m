Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F242C21D0;
	Mon, 30 Mar 2026 21:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774907190; cv=none; b=nh1FJjsqvtmGkO8VuDNCtNUDnAEbFGtsWHo0UGxDYqZKxHOI4zUK01Fpc4ohkgHc2ILROZxbVMxHtVbOO0ETwO2NBxXeOOdzQfjXhZL8ntX1PWchV2tyaGWbiexSefJhS9S76NK+gs5VhUekXdrNARVX07YxmTzbkN/KYVaGQ98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774907190; c=relaxed/simple;
	bh=ghvppbibQLhsu3h07tJ5l96HRuYjCm6y685Oi/Xia20=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WNbyOYmARuUTdPVZUQNyfAGRtvGcxKox7e/fpnso0PxZFpZAibnr7mIs+wOm0Cr0oYmwnuLzm6+NhcvP8VnEVe7+kOsQ02aq9qYAlJ0RI8kSDrdzj1KJuOCmVvuS34/Yo9wRx4Bn3JQ8Tmdtk44o1OSvfN3YetcnGoXegPzjpu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NjpM+ME9; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NjpM+ME9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=FA1e0Kn8ZWXspSYjROcLzHkilUuEsXatN+MaWYMDcjA=; b=NjpM+ME9QNKpe36V0Kd/8hoKTA
	Ik4tGco1emiFtAlWLj9+v2ArLWMhArFw641tXzXpEbboI2057owBnLprbt4MTUvNZp7kRaQPeUg2N
	rc3F09CK+grtb5m9/iPNkiMM3OMiVVkEIbxwnrXowL+dmjD4025c6YVxaLglybJYYEn646kz3S4t+
	KB4sKImXB8GOiOyLaGSW+dMfTet1xS/dW3gEKEK01AhsgqInXLd+fStnejQgNOo/FW27vvf22YusP
	j+U2mDs9/qMb5cQbyQp+NHG6dh3yUdz1t/mLinqZXfbFqTfJefeyttKufoSneKJqJP2mRRyVNTFNN
	akUbydXQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7KRF-0000000BvS6-3iaX;
	Mon, 30 Mar 2026 21:46:25 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Sergio Melas <sergiomelas@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH -next] hwmon: (yogafan) fix markup warning
Date: Mon, 30 Mar 2026 14:46:24 -0700
Message-ID: <20260330214624.3781789-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a blank line between the License and heading lines to prevent a
documentation build warning:

Documentation/hwmon/yogafan.rst:2: WARNING: Explicit markup ends without
  a blank line; unexpected unindent. [docutils]

Fixes: b773f2e6b472 ("hwmon: (yogafan) Add support for Lenovo Yoga/Legion fan monitoring")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Sergio Melas <sergiomelas@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Cc: linux-doc@vger.kernel.org

 Documentation/hwmon/yogafan.rst |    1 +
 1 file changed, 1 insertion(+)

--- linux-next.orig/Documentation/hwmon/yogafan.rst
+++ linux-next/Documentation/hwmon/yogafan.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0-only
+
 ===============================================================================================
 Kernel driver yogafan
 ===============================================================================================
