Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.8])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABC661C330D
	for <linux-hwmon@vger.kernel.org>; Tue, 19 Nov 2024 10:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732011637; cv=none; b=pyCUOfDWkzHxD6olSw9WjT4bGORYOzaCJYpA66wi/CZuT+p31f8tO+BJUwWPgqnhBt21TtGvuzrfYLzHdrjEzXWPBu2CMYR8tUH7rMLJSrOEQJx8OCLIDlrMNH3xn4FWXwzj9wLB67ldY1e/OSRj+r+CfzpqW9NSx9pvWQbLl78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732011637; c=relaxed/simple;
	bh=cr80setFQkb+HicAmRHKidwGqzhdJSMoba5ZQwQOueQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OUoWSVVvlrjCe7QQwXHo/BcppXVEs2Kj/TY9Cy1P8PWIVML6oxf2oOCD/vN6LHUsrimoy9T+UfUhkVxeH2eOdKxyMHF9MWZPRo4nit7etrKh1PDdq7OXVJljmpubE3Euj68CVaMeUL8KvPMpxOQTlewqlSD6f8+WUxxOa+fd6fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=ZfBjdG2l; arc=none smtp.client-ip=117.135.210.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="ZfBjdG2l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Y2Rlk
	M23+q/RmSNnamSnu5n9SxZAH/rknzHQi6Lbzeo=; b=ZfBjdG2lqOUWkN9uEicFz
	ZsLi7qWl4ovg/k1+vDq0QfyMq5LQlRIjSCKBubKZ3jNSH0QBn4rSUwTS15+aLgXj
	kvYl3tZwJGCTeyqufq+JjMz+nFsh6iT5yssvIFp9jI9u4EXrM79yOjw4/UVazQwQ
	p0jcsoecToL61lYVQ89qz4=
Received: from localhost.localdomain (unknown [122.225.16.198])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3X51iZjxn3rAbBw--.55581S2;
	Tue, 19 Nov 2024 18:20:30 +0800 (CST)
From: JuenKit Yip <hunterteaegg@126.com>
To: linux-hwmon@vger.kernel.org
Cc: JuenKit Yip <hunterteaegg@126.com>
Subject: [PATCH 2/2] dt-bindings: trivial-devices: add sensirion,sht3x
Date: Tue, 19 Nov 2024 05:20:16 -0500
Message-Id: <20241119102016.74418-1-hunterteaegg@126.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3X51iZjxn3rAbBw--.55581S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wr1DZFyrGry5Kw1UuFy7GFg_yoWfZrc_A3
	Wxuw1kAr48JF95t39Ikr1xJr1Yk3yIkFn7Cw1Uta97uw1xu39xKFyvqa4av3y7GrWUu3Wr
	urn7KrZFqwnrGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRtg4S7UUUUU==
X-CM-SenderInfo: xkxq3v5uwhtvljj6ij2wof0z/1tbiOhGc7Gc8V2bWagAAsN

add sensirion,sht3x as trivial device for devicetree support

Signed-off-by: JuenKit Yip <hunterteaegg@126.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 9bf0fb17a05e..be006b21b1ea 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -333,6 +333,8 @@ properties:
           - sensirion,sgp40
             # Sensirion low power multi-pixel gas sensor with I2C interface
           - sensirion,sgpc3
+            # Sensirion SHT3x-DIS humidity and temperature sensor with I2C interface
+          - sensirion,sht3x
             # Sensirion temperature & humidity sensor with I2C interface
           - sensirion,sht4x
             # Sensortek 3 axis accelerometer
-- 
2.39.5

