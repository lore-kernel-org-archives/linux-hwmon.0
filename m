Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77A8B640;
	Sat, 20 Jun 2026 01:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781918316; cv=none; b=opAxz2T4JotV3ylbiwFkQlRhxDIcQTnxwMNOhyAICmnteSnyjU396K2Uy8dosMhCk7vDj4CZRrgwUyN7FA4X1qNnwS1JFAspHC2yyG2P5IQd0Xyw98JPo7I1P+n0UY+dGSzR7k3yGbInaQyh3pZ7jj61BvZPNFXsGJ2w3iSkJFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781918316; c=relaxed/simple;
	bh=VS9ZBMz5EOWgb9lvQv+a+SsnLfs+Evzrr4S4/qAPDR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LrL2ktrIZi0Cx6lqe2WXMeveHZMk1JntjYtZ2Fn1HJtQ14c2diYWQq9o9ObwNd9zi4sl61sBQMFMPbTa/dofszBFsDeHNzqn3NXp8ardkb5YId4eZQfs30mGu/zJxSg0OJP9FZ0GgQ3/kYw4H1oubkutSwBvGKNT2J/yz6J3vtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=C3SiW+s5; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="C3SiW+s5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=AZK905ohyaY3kNqreNidFLu7yEOQOFl2JdDuTg2xTOo=; b=C3SiW+s5sxihMaeNW+2qCITEac
	Y1vC0TReGJDnyo65T2Ht0pQa5i7GKrcYVkZ12pu8Bf0m0734Cws8Dnclq6oUNvKeGsPF8ntNzauON
	OXmHgIIE3D5+EEBOeo5frV1K3ZNrutu7WE0NF5fPXrDypVzZQxYdQoW7vO3Zg/ehT5SLIhMKrrUO/
	oDmWSGiaWsW0INKPOF5tNxnqPmhSm1EeHdtjOZOEq6gcEtRNwf865+YY0tkL88WYPGV5XERwDbRvZ
	0g0kYf+BMMDNGPOmsbBTCvhIpHMZj3snFEbDmsrmZUYmJKpKwCFCDqrJ4v3j8nO0+0MAlguB4wDrD
	pGA7S5VQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wakLy-0000000375O-0OMG;
	Sat, 20 Jun 2026 01:18:34 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: ltc4283: fix malformed table docs build error
Date: Fri, 19 Jun 2026 18:18:30 -0700
Message-ID: <20260620011833.3568693-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Expand the table borders (upper & lower) to prevent a documentation
build error:

Documentation/hwmon/ltc4283.rst:261: ERROR: Malformed table.
Text in column margin in table line 3.
=======================         ==========================================
power1_failed_fault_log         Set to 1 by a power1 fault occurring.
power1_good_input_fault_log     Set to 1 by a power1 good input fault occurring at PGIO3.

Fixes: dd63353a0b5e ("hwmon: ltc4283: Add support for the LTC4283 Swap Controller")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Nuno Sá <nuno.sa@analog.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org

 Documentation/hwmon/ltc4283.rst |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20260619.orig/Documentation/hwmon/ltc4283.rst
+++ linux-next-20260619/Documentation/hwmon/ltc4283.rst
@@ -256,7 +256,7 @@ these logs can be cleared by writing in
 ``/sys/kernel/debug/i2c/i2c-[X]/[X]-addr/``
 contains the following attributes:
 
-=======================		==========================================
+==============================  ==========================================================
 power1_failed_fault_log		Set to 1 by a power1 fault occurring.
 power1_good_input_fault_log	Set to 1 by a power1 good input fault occurring at PGIO3.
 in11_fet_short_fault_log	Set to 1 when a FET-short fault occurs.
@@ -264,4 +264,4 @@ in11_fet_bad_fault_log		Set to 1 when a
 in0_lcrit_fault_log		Set to 1 by a VIN undervoltage fault occurring.
 in0_crit_fault_log		Set to 1 by a VIN overvoltage fault occurring.
 curr1_crit_fault_log		Set to 1 by an overcurrent fault occurring.
-======================= 	==========================================
+==============================  ==========================================================
