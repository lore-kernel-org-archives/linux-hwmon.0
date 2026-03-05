Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1F63A7F56;
	Thu,  5 Mar 2026 14:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772721666; cv=none; b=I9i3BMMIgvNG769jOaUSsZtFExmZHI+y2JzJ1wc0f9kCE2Wx+UVL9aW34VE80c/omTjiU1XZTxqW+xuKhEJwaWaXc/MjzSjNsr6n+66WPs2NTUbIgWN7P19bFukZKUc7Qn+4yOliATwAN4ftYygW7yOV4cWchqRyeb6vzIs9FVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772721666; c=relaxed/simple;
	bh=xGkp8fYJ2LTzql271XIwf5uROIQikHbTf8TrOVoyjEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JdybslhFxOpv87r1LzKr94jkCJZlAikkwoMiqAxVzGZ1Tmfvsh35yxCPWrny1hk0U5dkTmg2GKJsUwf1feGxQIDEkgkTjR44+Q1HeGsmVLWwNPa9GGTS6EzR8Su8V6qvgV2AMFZCZST0q9Ay/wEzsRBggw88rLa1Ooo3LIXq97Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.103.14])
	by APP-03 (Coremail) with SMTP id rQCowABnhNvulalpTx7iCQ--.24548S3;
	Thu, 05 Mar 2026 22:40:54 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rahul Tanwar <rtanwar@maxlinear.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH v2 1/2] dt-bindings: hwmon: moortec,mr75203: adapt multipleOf for T-Head TH1520
Date: Thu,  5 Mar 2026 22:40:43 +0800
Message-ID: <20260305144044.44208-2-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260305144044.44208-1-zhengxingda@iscas.ac.cn>
References: <20260305144044.44208-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABnhNvulalpTx7iCQ--.24548S3
X-Coremail-Antispam: 1UD129KBjvJXoW7CrWUuF1UGFyxuF4UurW5trb_yoW8XF18pr
	43KFyUJFs7WFyxZ3y7C3WrCr13X3Z5Xa15GayDJa4xtan8Aa1Utw4fKw1DAF1kCrWSqFW3
	KFW0gF4Fy34kAw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPE14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I2
	62IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcV
	AFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG
	0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI
	1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
	CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
	I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
	8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
	UjIFyTuYvjfU8XdbUUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

The G and J coefficients provided by T-Head TH1520 manual (which calls
them A and C coefficients and calls H coefficient in the binding as B)
has the 1/100 degree Celsius bit (the values are 42.74 and -0.16
correspondingly), however the binding currently only allows cofficients
as precise as 100 milli-Celsius (1/10 degree Celsius).

Change the multipleOf value of these two cofficients to 10 (in the unit
of milli-Celsius) to satisfy the need of TH1520.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
New patch in v2.

 Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
index 56db2292f062d..7d57c2934a8a1 100644
--- a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
+++ b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
@@ -105,7 +105,7 @@ properties:
       G coefficient for temperature equation.
       Default for series 5 = 60000
       Default for series 6 = 57400
-    multipleOf: 100
+    multipleOf: 10
     minimum: 1000
     $ref: /schemas/types.yaml#/definitions/uint32
 
@@ -131,7 +131,7 @@ properties:
       J coefficient for temperature equation.
       Default for series 5 = -100
       Default for series 6 = 0
-    multipleOf: 100
+    multipleOf: 10
     maximum: 0
     $ref: /schemas/types.yaml#/definitions/int32
 
-- 
2.52.0

