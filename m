Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23662E2DD4
	for <linux-hwmon@vger.kernel.org>; Thu, 14 Aug 2025 08:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755158841; cv=none; b=ixC4T/tw2XOliJHqtp/UZSM8WKaILwCBPzNq+NV76LXfhn62VSf8sNJn6MYoM1QbZ5OGjD85D7/lH+0BzKDVF9X3I8m/9mJpr4g8yPexnjIxFDxVlIkDh+Uc0RFiPeqtFdkaxXddTCk+NM9gWXq3hvKM07fMVUkefsX5tgmXfTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755158841; c=relaxed/simple;
	bh=lMpxQL3vxiHjhSQ6qRV95klnp1jlsr1g47iiI4+lswU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lxbqMLR+15WQWxt1gSkXuOoIF7oV6RgrBDaMs5OKRSKsIGhCbtgd8Vhy5dqFWWF0zIJkLWnRdcfacyN9qhm4y39ow0zfW5flpkZtQ+J+FA6UPwxyC78ACNYQtn9FWRh/vKEWEp+ELkJHnjK4W13ju7ablEstJKRc3DkQzLse3xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=0i/93Bll; arc=none smtp.client-ip=212.77.101.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="0i/93Bll"
Received: (wp-smtpd smtp.wp.pl 2740 invoked from network); 14 Aug 2025 10:07:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1755158832; bh=xDw4DWxZS/qq7zJvdZ1W4x8BSzX0OHBxZaPftTdF3V8=;
          h=From:To:Cc:Subject;
          b=0i/93Bllel6CaR24SeXMSfhI7vsF37jckxENf3TF1po9XifsrvU8tANdRx4YsXmD9
           cmIbivbL3lGCqGfK6lXPirXKcXTx2RJa/aoE0IlW8kZ5lyiG6y1taL5DBayKfmbcmD
           i2Bnrwlp8/T6SUUs1crZFSmKSL6rFkmQaHGNS69iSSqIp79urBkbvAEeZsKMDD8AkF
           c6Syg3LUuhwrseWYCTtMkOAcE4K2bCjqIi4hM4Tz6KdZnrh4O7X60oV/JlGbH+KJvn
           5LgKGheSf9fI5Cf2kj4yN+Qmz8MqkaVwmDZU7lCKmDJByIjGY3cgQp7x5FsLQX8zoQ
           lzbShrv7Ue8aw==
Received: from 83.24.134.210.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.134.210])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <jdelvare@suse.com>; 14 Aug 2025 10:07:12 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	fe@dev.tdt.de,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH v2] dt-bindings: hwmon: convert lantiq-cputemp to yaml
Date: Thu, 14 Aug 2025 10:04:41 +0200
Message-ID: <20250814080708.3054732-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: 02e1e0d59fb63bd60bbca17161f711ee
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [4QPE]                               

Convert the Lantiq cpu temperature sensor bindings to yaml format.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
v2:
- added reg property 
---
 .../bindings/hwmon/lantiq,cputemp.yaml        | 30 +++++++++++++++++++
 .../devicetree/bindings/hwmon/ltq-cputemp.txt | 10 -------
 2 files changed, 30 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/lantiq,cputemp.yaml
 delete mode 100644 Documentation/devicetree/bindings/hwmon/ltq-cputemp.txt

diff --git a/Documentation/devicetree/bindings/hwmon/lantiq,cputemp.yaml b/Documentation/devicetree/bindings/hwmon/lantiq,cputemp.yaml
new file mode 100644
index 000000000000..9419b481ff35
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/lantiq,cputemp.yaml
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/lantiq,cputemp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lantiq cpu temperature sensor
+
+maintainers:
+  - Florian Eckert <fe@dev.tdt.de>
+
+properties:
+  compatible:
+    const: lantiq,cputemp
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    cputemp@103040 {
+        compatible = "lantiq,cputemp";
+        reg = <0x103040 0x4>;
+    };
diff --git a/Documentation/devicetree/bindings/hwmon/ltq-cputemp.txt b/Documentation/devicetree/bindings/hwmon/ltq-cputemp.txt
deleted file mode 100644
index 473b34c876dd..000000000000
--- a/Documentation/devicetree/bindings/hwmon/ltq-cputemp.txt
+++ /dev/null
@@ -1,10 +0,0 @@
-Lantiq cpu temperature sensor
-
-Requires node properties:
-- compatible value :
-	"lantiq,cputemp"
-
-Example:
-	cputemp@0 {
-		compatible = "lantiq,cputemp";
-	};
-- 
2.47.2

