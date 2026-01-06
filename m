Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E825E3A1E67;
	Tue,  6 Jan 2026 15:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767714906; cv=pass; b=WCb7PtqcjOxvIYfbM/OMxtz1ZG0IRa3kkAZutiSy+jpHLwlY7V+GqofxYWT0qOud5PqqlGLkUQD6+jY4sTZUyXHakrMRjIC2FwdzPy4wTGLyhuX8MlLUsZlTSAAuRZNSjfKMiatm0zpL649U+Sr70ly4RCySSxScRA+NdpTdQLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767714906; c=relaxed/simple;
	bh=UPYj+9lEjAVDRwy1F96GqDR9Wxv0eAshP9Qgdtz0xh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lPVLVFAXyJxsJx5P8GZwzeQ3ixOvWm5LdkY9AYOWkwiDvtOR0a2Xut/XV9E94Z5LjmK/OnpshU9U+iN3XuTa/lkOkebXkzfZHy6cZwS0S4t7nJ70vvj7xAvFajte1PG3/PHZC82D1fVa/xrMuZdvXzxUlLrjfZdWlOZCKmOrLiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=laveeshbansal.com; spf=pass smtp.mailfrom=laveeshbansal.com; dkim=pass (1024-bit key) header.d=laveeshbansal.com header.i=laveeshb@laveeshbansal.com header.b=ka6bz2Ps; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=laveeshbansal.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=laveeshbansal.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=laveeshbansal.com header.i=laveeshb@laveeshbansal.com header.b="ka6bz2Ps"
ARC-Seal: i=1; a=rsa-sha256; t=1767714871; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aypGUZKr70HylUVelPofETL/3mVVb1ZibclbCl30FD62UWDhzwSYe7m8LBWuPqqV/H0n933oxQ/h+fL2bNYDGv6CDN38xay9wc/FA7QGaJgULw2kfbUxNGmXOjS0+MJYN3COmHk8wVHF9zJh62/tmvvveRkVESxBHCFVAB2YnCc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767714871; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=y+sLLeOwEv8kDe30IH63tJN1rh/nhs9zKUo7OS4TBmo=; 
	b=h0oensPs3C1xYXBTfp2MLCLF1SvdZoO9QDHmJVSh6HrbBIH4tiImJbvFW5sK1a3y658YJCugMAgCKVxvSS38vmxM/tVvb8S1+qstQSQ2Er4fVPUp+Pu4cwtHDvLzfts421v37hlbEjUSg3JUG0TgIAwpLFLmiyXLue82AFe/flY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=laveeshbansal.com;
	spf=pass  smtp.mailfrom=laveeshb@laveeshbansal.com;
	dmarc=pass header.from=<laveeshb@laveeshbansal.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767714871;
	s=zoho; d=laveeshbansal.com; i=laveeshb@laveeshbansal.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=y+sLLeOwEv8kDe30IH63tJN1rh/nhs9zKUo7OS4TBmo=;
	b=ka6bz2PsaDSpTmsr3Bq78Y3n2RrUQmYALNGTt+AvRxLa/AMAFvOLh3g7TfiqUzGK
	A7TYMA2EJpBrsyvUgBVpRoQmsC+kUaE7cg2hmY+PJK71hmJUrW7Fv4HNj67abey4G8j
	6Ow4UoHqSXlGmTCdAXxbDXrH+AZr1ntstuiKNpAQ=
Received: by mx.zohomail.com with SMTPS id 1767714867078244.3214687346034;
	Tue, 6 Jan 2026 07:54:27 -0800 (PST)
From: Laveesh Bansal <laveeshb@laveeshbansal.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Laveesh Bansal <laveeshb@laveeshbansal.com>
Subject: [PATCH 1/2] Documentation: hwmon: coretemp: Update supported CPUs and TjMax values
Date: Tue,  6 Jan 2026 15:54:25 +0000
Message-ID: <20260106155426.547872-2-laveeshb@laveeshbansal.com>
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

Update the coretemp documentation to reflect current driver capabilities:

- Extend the supported CPU model list to include Atom processors from
  Bonnell through Jasper Lake, maintaining the original format with
  model numbers and adding X86_FEATURE_DTHERM as the actual detection
  mechanism. Added models: 0x37 (Bay Trail), 0x4a (Merrifield),
  0x4c (Cherry Trail), 0x5a (Moorefield), 0x5c (Apollo Lake),
  0x7a (Gemini Lake), 0x96 (Elkhart Lake), 0x9c (Jasper Lake)

- Update the description to note that per-package temperature sensing
  is available on Sandy Bridge and all newer processors

- Clarify that TjMax is read from MSR_IA32_TEMPERATURE_TARGET on modern
  CPUs (Nehalem and newer)

- Add TjMax values for newer Atom processor families to Appendix A:
  - 22nm Silvermont/Bay Trail: E38xx at 110C, Z37xx at 90C
  - 22nm Silvermont/Moorefield: Z35xx at 90C
  - 14nm Airmont/Cherry Trail: Z8xxx at 90C
  - 14nm Goldmont/Apollo Lake: 105C
  - 14nm Goldmont Plus/Gemini Lake: 105C
  - 10nm Tremont/Elkhart Lake: 105C
  - 10nm Tremont/Jasper Lake: 105C

TjMax values obtained from Intel ARK and official datasheets:
- E3845: https://www.intel.com/content/www/us/en/products/sku/78475/intel-atom-processor-e3845-2m-cache-1-91-ghz/specifications.html
- Z3600/Z3700: https://www.intel.com/content/dam/www/public/us/en/documents/datasheets/atom-z36xxx-z37xxx-datasheet-vol-1.pdf

Signed-off-by: Laveesh Bansal <laveeshb@laveeshbansal.com>
---
 Documentation/hwmon/coretemp.rst | 56 ++++++++++++++++++++++++++------
 1 file changed, 46 insertions(+), 10 deletions(-)

diff --git a/Documentation/hwmon/coretemp.rst b/Documentation/hwmon/coretemp.rst
index c609329e3bc4..3afb179e0ced 100644
--- a/Documentation/hwmon/coretemp.rst
+++ b/Documentation/hwmon/coretemp.rst
@@ -2,17 +2,21 @@ Kernel driver coretemp
 ======================
 
 Supported chips:
-  * All Intel Core family
+  * All Intel Core family and Atom processors with Digital Thermal Sensor (DTS)
 
     Prefix: 'coretemp'
 
-    CPUID: family 0x6, models
+    CPUID: family 0x6, models with X86_FEATURE_DTHERM, including:
 
 			    - 0xe (Pentium M DC), 0xf (Core 2 DC 65nm),
 			    - 0x16 (Core 2 SC 65nm), 0x17 (Penryn 45nm),
 			    - 0x1a (Nehalem), 0x1c (Atom), 0x1e (Lynnfield),
 			    - 0x26 (Tunnel Creek Atom), 0x27 (Medfield Atom),
-			    - 0x36 (Cedar Trail Atom)
+			    - 0x36 (Cedar Trail Atom), 0x37 (Bay Trail Atom),
+			    - 0x4a (Merrifield Atom), 0x4c (Cherry Trail Atom),
+			    - 0x5a (Moorefield Atom), 0x5c (Apollo Lake Atom),
+			    - 0x7a (Gemini Lake Atom),
+			    - 0x96 (Elkhart Lake Atom), 0x9c (Jasper Lake Atom)
 
     Datasheet:
 
@@ -28,9 +32,9 @@ Description
 
 This driver permits reading the DTS (Digital Temperature Sensor) embedded
 inside Intel CPUs. This driver can read both the per-core and per-package
-temperature using the appropriate sensors. The per-package sensor is new;
-as of now, it is present only in the SandyBridge platform. The driver will
-show the temperature of all cores inside a package under a single device
+temperature using the appropriate sensors. The per-package sensor is
+available on Sandy Bridge and all newer processors. The driver will show
+the temperature of all cores inside a package under a single device
 directory inside hwmon.
 
 Temperature is measured in degrees Celsius and measurement resolution is
@@ -56,10 +60,11 @@ tempX_label	  Contains string "Core X", where X is processor
 		  where Y is the package number.
 ================= ========================================================
 
-On CPU models which support it, TjMax is read from a model-specific register.
-On other models, it is set to an arbitrary value based on weak heuristics.
-If these heuristics don't work for you, you can pass the correct TjMax value
-as a module parameter (tjmax).
+On modern CPUs (Nehalem and newer), TjMax is read from the
+MSR_IA32_TEMPERATURE_TARGET register. On older models without this MSR,
+TjMax is determined using lookup tables or heuristics. If these don't work
+for your CPU, you can pass the correct TjMax value as a module parameter
+(tjmax).
 
 Appendix A. Known TjMax lists (TBD):
 Some information comes from ark.intel.com
@@ -100,6 +105,37 @@ Process		Processor					TjMax(C)
 		D2700/2550/2500					100
 		N2850/2800/2650/2600				100
 
+22nm		Atom Processors (Silvermont/Bay Trail)
+		E3845/3827/3826/3825/3815/3805			110
+		Z3795/3775/3770/3740/3736/3735/3680		90
+
+22nm		Atom Processors (Silvermont/Moorefield)
+		Z3580/3570/3560/3530				90
+
+14nm		Atom Processors (Airmont/Cherry Trail)
+		x5-Z8550/Z8500/Z8350/Z8330/Z8300		90
+		x7-Z8750/Z8700					90
+
+14nm		Atom Processors (Goldmont/Apollo Lake)
+		x5-E3940/E3930					105
+		x7-E3950					105
+
+14nm		Celeron/Pentium Processors (Goldmont/Apollo Lake)
+		J3455/J3355					105
+		N3450/N3350					105
+		N4200						105
+
+14nm		Celeron/Pentium Processors (Goldmont Plus/Gemini Lake)
+		J4105/J4005					105
+		N4100/N4000					105
+		N5000						105
+
+10nm		Atom Processors (Tremont/Elkhart Lake)
+		x6000E						105
+
+10nm		Celeron/Pentium Processors (Tremont/Jasper Lake)
+		N4500/N5100/N6000 series			105
+
 45nm		Xeon Processors 5400 Quad-Core
 		X5492, X5482, X5472, X5470, X5460, X5450	85
 		E5472, E5462, E5450/40/30/20/10/05		85
-- 
2.43.0

