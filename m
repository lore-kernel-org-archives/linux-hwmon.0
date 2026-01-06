Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AD31684BE;
	Tue,  6 Jan 2026 15:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767714922; cv=pass; b=ANYEXwg4cmLqtWAtQNeD+W8mlrMcPugPeSnHpmVNs2uQJ7pZ6xCy3wnkeP2YKTvMT9v6NiBYqf0s4bHsGZW0YPpT6UJO4QKBsof4r7ZxMzKgzr/F4h7pDPiJ1k8CD4TS9nNlYx3JMJz61n2tExDwRJqHkdG75JCXh+lXahpb29g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767714922; c=relaxed/simple;
	bh=dosFqktUwke3weGqbtl7uAwg62QNyHgNc1TKoDv7T88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aoVUQu600qFC5RpcYa40Q8pQKiS4tKj8Pt7PYCCk7K2l2qT4/hdwJeSRnjzBBqq0BQfsfOQrX6w1sanTqFrzHQWsPZmi5XdSDagWSfcsPHX8egBkrIIHvu3QQKFQz8DiMGBQ/lmWbMy9+Pw+vFGTojM3t1tARMqvbedWhnAs5o0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=laveeshbansal.com; spf=pass smtp.mailfrom=laveeshbansal.com; dkim=pass (1024-bit key) header.d=laveeshbansal.com header.i=laveeshb@laveeshbansal.com header.b=ZLD3zrx1; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=laveeshbansal.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=laveeshbansal.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=laveeshbansal.com header.i=laveeshb@laveeshbansal.com header.b="ZLD3zrx1"
ARC-Seal: i=1; a=rsa-sha256; t=1767714872; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KQrze7jxRGDhvtCbNhbluOa0Hdv8VoX9lJ20wzsVw0WIRulN02L1oHTpRGPgNQz42LcQzvznG2nOYA3vZBZZjsjcrNnAZTD7aBUQrexZBlbRdAut8QjEJsjKd91KBde9wT4zRKOt+RTgapilQLfgziokHFIuUW1/MqT3bItOWnk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767714872; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1kgU0mLAdPYvBxuccEdm9OLAZpF9SQG8KIFEF16Nl70=; 
	b=dT2b7AAWdJPoMpY+FzkRbdiVyQu9sgwJdui+YeFH/kclHM0t1CQhXxC21LSifpJf3EpQ2DMot0HX5jBe271goIJIMRRlLgw7JiCIvzgIBu6E0kwxVjums1uF2Gctxblnrl1+FFbu4PzYMYb/sOKImBaqMBNG5DJBlfB39SQZaIM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=laveeshbansal.com;
	spf=pass  smtp.mailfrom=laveeshb@laveeshbansal.com;
	dmarc=pass header.from=<laveeshb@laveeshbansal.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767714872;
	s=zoho; d=laveeshbansal.com; i=laveeshb@laveeshbansal.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=1kgU0mLAdPYvBxuccEdm9OLAZpF9SQG8KIFEF16Nl70=;
	b=ZLD3zrx14BCDafvHgcjAhppfaedVCutMmvY9jcpuG69K2II4p11zlwrwFaeL79uc
	v7yvBG4aXe1kLUqL0q7eHtlgIvXan+VNGo4Yd9y+dy0byXz2we30DEJ3qf/syE17Hb8
	my3SrNcfTIBOwBSye9dDg2iwuJzAuN4m7A4Ei1bI=
Received: by mx.zohomail.com with SMTPS id 1767714867515151.3205125188755;
	Tue, 6 Jan 2026 07:54:27 -0800 (PST)
From: Laveesh Bansal <laveeshb@laveeshbansal.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Laveesh Bansal <laveeshb@laveeshbansal.com>
Subject: [PATCH 2/2] hwmon: (coretemp) Add TjMax for Silvermont through Tremont Atoms
Date: Tue,  6 Jan 2026 15:54:26 +0000
Message-ID: <20260106155426.547872-3-laveeshb@laveeshbansal.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106155426.547872-1-laveeshb@laveeshbansal.com>
References: <20260106155426.547872-1-laveeshb@laveeshbansal.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add fallback TjMax values for Intel Atom processors based on Silvermont,
Airmont, Goldmont, and Tremont microarchitectures. These processors
support MSR_IA32_TEMPERATURE_TARGET for reading TjMax directly, so these
table entries serve as fallback values only when the MSR read fails
(e.g., in some virtualization scenarios).

Added processors and TjMax values:

- INTEL_ATOM_SILVERMONT (0x37, Bay Trail):
  - Stepping 9 (E38xx embedded): 110C
  - Other steppings (Z37xx tablet): 90C
  Stepping identified from Intel E3800 Specification Update.

- INTEL_ATOM_SILVERMONT_MID (0x4a, Merrifield): 90C

- INTEL_ATOM_SILVERMONT_MID2 (0x5a, Moorefield): 90C

- INTEL_ATOM_AIRMONT (0x4c, Cherry Trail): 90C

- INTEL_ATOM_GOLDMONT (0x5c, Apollo Lake): 105C

- INTEL_ATOM_GOLDMONT_PLUS (0x7a, Gemini Lake): 105C

- INTEL_ATOM_TREMONT (0x96, Elkhart Lake): 105C

- INTEL_ATOM_TREMONT_L (0x9c, Jasper Lake): 105C

Not included (MSR reads work reliably, server/specialized chips):
- INTEL_ATOM_SILVERMONT_D (Avoton): Server, Tcase 97C
- INTEL_ATOM_GOLDMONT_D (Denverton): Server, Tcase 82C
- INTEL_ATOM_AIRMONT_NP (Lightning Mountain): Network processor
- INTEL_ATOM_TREMONT_D (Jacobsville): Server
- INTEL_ATOM_GRACEMONT (Alder Lake-N): Very new, MSR works

Reference: Intel datasheets and ARK processor specifications
- Z3600/Z3700 datasheet: https://www.intel.com/content/dam/www/public/us/en/documents/datasheets/atom-z36xxx-z37xxx-datasheet-vol-1.pdf
- E3845 ARK: https://www.intel.com/content/www/us/en/products/sku/78475/intel-atom-processor-e3845-2m-cache-1-91-ghz/specifications.html
- E3800 Spec Update: https://community.intel.com/cipcp26785/attachments/cipcp26785/embedded-atom-processors/4708/1/600834-329901-intel-atom-processor-e3800-product-family-su-rev015.pdf

Signed-off-by: Laveesh Bansal <laveeshb@laveeshbansal.com>
---
 drivers/hwmon/coretemp.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
index ad79db5a183e..d2dfa4e30407 100644
--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@ -145,6 +145,15 @@ static const struct tjmax_model tjmax_model_table[] = {
 							 * Also matches S12x0 (stepping 9), covered by
 							 * PCI table
 							 */
+	{ INTEL_ATOM_SILVERMONT,      9, 110000 },	/* Atom Bay Trail E38xx (embedded) */
+	{ INTEL_ATOM_SILVERMONT,      ANY, 90000 },	/* Atom Bay Trail Z37xx (tablet) */
+	{ INTEL_ATOM_SILVERMONT_MID,  ANY, 90000 },	/* Atom Merrifield (Z34xx) */
+	{ INTEL_ATOM_SILVERMONT_MID2, ANY, 90000 },	/* Atom Moorefield (Z35xx) */
+	{ INTEL_ATOM_AIRMONT,	      ANY, 90000 },	/* Atom Cherry Trail (Z8xxx) */
+	{ INTEL_ATOM_GOLDMONT,	      ANY, 105000 },	/* Atom Apollo Lake (J3xxx, N3xxx, E39xx) */
+	{ INTEL_ATOM_GOLDMONT_PLUS,   ANY, 105000 },	/* Atom Gemini Lake (J4xxx, N4xxx, N5xxx) */
+	{ INTEL_ATOM_TREMONT,	      ANY, 105000 },	/* Atom Elkhart Lake */
+	{ INTEL_ATOM_TREMONT_L,	      ANY, 105000 },	/* Atom Jasper Lake */
 };
 
 static bool is_pkg_temp_data(struct temp_data *tdata)
-- 
2.43.0

