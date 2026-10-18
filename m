Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6184242CB1C;
	Sun, 18 Oct 2026 04:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792299315; cv=none; b=IdE1vg7pGd27zabK32TBcxA2I+fT79QuIKl6avQXWKYuXPsW/Ubgel3kmMJmN6JwSEWJb6UkIGytDOSFFTdlDTxBtQrcwkuKs5g0wF5gVP/ygBqNmKGi7+JuNV7LNHDE5n4Lgt+71ccC9lbsBFWy1m9iJJ4G1aV9CMe34yVVUyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792299315; c=relaxed/simple;
	bh=St4QUOnykiewwv5EWmKAgq6LofwIxgwobf+CO8xJ7Cw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DM3t5KxNrH32JFpsNqPamFlch2pSzsPtbEDTmI2SUGWic7mlY/AJDa8t0CqZ2kF6FJfzHbzZZcUGsXunQJad+cPmb36h2VAEIJV1dUg/pm1G19DiD6l2YsTZ05bFtoivWxi7yNpio7Mx/xEnqgdfWNMSAFZ+sOivk5aaHNXO9Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EVaZFPgu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EVaZFPgu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0388EC4AF1B;
	Sun, 18 Oct 2026 04:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792299315;
	bh=St4QUOnykiewwv5EWmKAgq6LofwIxgwobf+CO8xJ7Cw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EVaZFPguy1CSmuXJVzvtLdcgiUiMUvwA44isfx1jNqnAYgXj9HrYugfgFgakMMEF4
	 kIttJkrC938RlLw6aCQBZknlKI+DJHtiQqmzW2btxAs3ycdOeJ1/HrOsx8H5Kkr6L3
	 TtyEviRoBDj/33EoQF1rUi+6veTRgB48bOMA71K/HnB6gLIEVmCM8oav39xNo7Ldpx
	 57WCSYCFW4E2hNszLy37UBsxdgkyaxX9vle1f3SAABzuIRhQz+Vcb5E0hJIqzD0bNl
	 yp4DWc2IGN6RxKVoGscw5cNFQgUBCe4gn2OJoI3GyhIEVQXxc8h+WREdRtPvCpwTb9
	 +t7o8ANDQjw4w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD40ECCF2CF;
	Sun, 18 Oct 2026 04:55:12 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Sun, 18 Oct 2026 07:55:00 +0300
Subject: [PATCH 2/2] arm64: dts: rockchip: Label the fans on Kobol Helios64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-helios64-fan-label-v1-2-69a3f96d4efa@iav.lv>
References: <20261018-helios64-fan-label-v1-0-69a3f96d4efa@iav.lv>
In-Reply-To: <20261018-helios64-fan-label-v1-0-69a3f96d4efa@iav.lv>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1083; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=8aw4Q5PUDH6ZuJvAmunt0x+2TojvBEPQhOMZdMQFsu4=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFlXAnWNvvozNJcwG/2IF53P377q+jN24+aDyi9OWF76Y
 VjwYd2DjlIWBjEuBlkxRZYJhzRuZSy5+tffw/wBzBxWJpAhDFycAjARpxUM/9Q0si8d+u9uvkTq
 fGi3Y591yt/ohHMNGo0+tbafjjhqcDMybBVtdBKLYUk2kte+/jTVbEHY7alm522eTNvJp8i+KnE
 iMwA=
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv

From: Igor Velkov <iav@iav.lv>

Name each fan after the header it plugs into, so that userspace can
tell the two apart through the hwmon label attribute.

Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
 arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
index 63ad79b4c8ac..a206827903e9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
@@ -70,8 +70,8 @@ clkin_gmac: external-gmac-clock {
 	};
 
 	fan1 {
-		/* fan connected to P7 */
 		compatible = "pwm-fan";
+		label = "P7";
 		pwms = <&pwm0 0 40000 0>;
 		cooling-levels = <0 80 170 255>;
 		interrupt-parent = <&gpio4>;
@@ -81,8 +81,8 @@ fan1 {
 	};
 
 	fan2 {
-		/* fan connected to P6 */
 		compatible = "pwm-fan";
+		label = "P6";
 		pwms = <&pwm1 0 40000 0>;
 		cooling-levels = <0 80 170 255>;
 		interrupt-parent = <&gpio4>;

-- 
2.43.0


