Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FE13AEF35;
	Mon,  9 Mar 2026 16:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773073518; cv=none; b=fJL6ySKXvevt+oSQqzztFD3bvaWSwPRI2e28s6G+0zTF5GyKeTPD7MGegdqdSHgPSY/AqWjiHgCl88FbWsR28SwLZydNo9uKtPUl1nkuJq0u45z4l0v8eUv0DewpBO44xGDOqHEx4f/ZM/LQgocxUK4jwTT36tEYIIE0uPzlYX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773073518; c=relaxed/simple;
	bh=5Pyx50HhsjK6noupPRFGXJnZwpB4Lr1jzHYCfxGwIpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o+tdO6tWb+jCZEp84qi48ocmPX6kgrofGilDx7JvhW4+n28aByqACOzX5yp7dnN1sEznfQsXuEZVuq3CoJn/mdbCtd2lLdN23pK2QGCGA7nMrsCELIl/aJN+5ExFlTVeohTLkRAcdIGzBuTXDUEyj+htIzF6wItP9elylfQzo4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.103.14])
	by APP-05 (Coremail) with SMTP id zQCowABH1Qhb9K5pgkP5CQ--.22703S3;
	Tue, 10 Mar 2026 00:25:04 +0800 (CST)
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
	Han Gao <rabenda.cn@gmail.com>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH v3 1/2] dt-bindings: hwmon: moortec,mr75203: adapt multipleOf for T-Head TH1520
Date: Tue, 10 Mar 2026 00:24:56 +0800
Message-ID: <20260309162457.4128205-2-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260309162457.4128205-1-zhengxingda@iscas.ac.cn>
References: <20260309162457.4128205-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABH1Qhb9K5pgkP5CQ--.22703S3
X-Coremail-Antispam: 1UD129KBjvJXoW7CrWUuF18Jr1rKrWDJr45GFg_yoW8WFWxpF
	W3KF17JF4kWFyxu39Fy3WrCr1Yq3Z5Xa15GayDXa4xtan8Za1Uta13Kr4DAF1kCrWSqaya
	gayUKF4Fy34kAw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
	nUUI43ZEXa7VUjrHUDUUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

The G and J coefficients provided by T-Head TH1520 manual (which calls
them A and C coefficients and calls H coefficient in the binding as B)
have 1/100 degree Celsius precision (the values are 42.74 and -0.16
respectively), however the binding currently only allows coefficients as
precise as 100 milli-Celsius (1/10 degree Celsius).

Change the multipleOf value of these two coefficients to 10 (in the unit
of milli-Celsius) to satisfy the need of TH1520.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Reviewed-by: Drew Fustini <fustini@kernel.org>
---
Changes in v3:
- Added Drew's R-b.
- Fixed some typos in the commit message and slightly reworded the
  precision sentence.

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

