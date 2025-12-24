Received: from www3141.sakura.ne.jp (www3141.sakura.ne.jp [49.212.207.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD2532AAD0;
	Wed, 24 Dec 2025 08:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=49.212.207.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766565728; cv=pass; b=NLQM5lQmz5nilY1ImRCNZX6CVUb7NwQdQHzImcTAbTRze0ftZjzEKd42DKEp7TxqATzDwZrlXyQaLMCCFAHFlccBsDH6hgW/XA/oRbAiIKtxo677jw86probciAiN6zLY1eG111pRT3V1xeOWecs8sU9QZDwEcM0vYRINHx5iF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766565728; c=relaxed/simple;
	bh=Fc1+pyr7p5Yn8Bq97RfqaNhYLt8DlQHbaXsTg30+Eeg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FXFENlE9tX5nGXGZNULiY/KwQ4pHPUaYgOI9uYILuvp1bwU/1Jn84Z02nBrpFuLXTIkPAQbROVKfgZXwe5rJk0L4s4O9TRWRmZ/KU63U8617JubVsArKEdE7H9zpr5mfD0O+q4xPFjwHgeBm6BEJqPDBM6SfoV0YszK+eduJn/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org; spf=pass smtp.mailfrom=redadmin.org; dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b=dildJhKG; arc=pass smtp.client-ip=49.212.207.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redadmin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b="dildJhKG"
Received: from www.redadmin.org (bc043154.ppp.asahi-net.or.jp [222.228.43.154])
	(authenticated bits=0)
	by www3141.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 5BO8cq3U007035
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 24 Dec 2025 17:38:52 +0900 (JST)
	(envelope-from weibu@redadmin.org)
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id C4441109D5746;
	Wed, 24 Dec 2025 17:38:51 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pOYzVlgpNVHq; Wed, 24 Dec 2025 17:38:47 +0900 (JST)
Received: by www.redadmin.org (Postfix, from userid 1000)
	id 8874910A0ECCF; Wed, 24 Dec 2025 17:38:47 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space; t=1766565527;
	cv=none; b=gzgMwxS0W8KiSRcwpjGyWYl9uHWSmex6mi7qhb/VcYSN42rLkbn/KW+1zx1FBUlPGm18FXA4GQPrFMQG0HOs0492neUW6GPQ63cIn+sA5WwES3unYsmPtOoxpp322GGw/xSB9AzVcsYqY5sSnSxJm85ylou6ORQx4DgPIkgVAXI=
ARC-Message-Signature: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space;
	t=1766565527; c=relaxed/relaxed;
	bh=55Wdlxhr6LRYHaQsgdonHzFOxbh0VPJ42HcRCsxXoWA=;
	h=DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding; b=BCPNHvQwYypZlGR9D9qFIdmE2/FwFiEYOipg55d/jvQL7RBN7kVwfzL3kfcQQCi7YgJIR2F45lFilGgNsh6czrydO3wTLqNOToA0SB4Qs2CzmD5lKXErHWEKVZPsb/qfqz2HfyKdO9070RGFwh4pFzLLToHS5njdaMqyVot5Q+U=
ARC-Authentication-Results: i=1; www.redadmin.org
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org 8874910A0ECCF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1766565527;
	bh=55Wdlxhr6LRYHaQsgdonHzFOxbh0VPJ42HcRCsxXoWA=;
	h=From:To:Cc:Subject:Date:From;
	b=dildJhKGDsFhkveq50tYibePfrP+nFZutqRS2kMXGNw6oO3sqREtQiZYTxDUxWqQZ
	 +RTPh3MrGJiG/cKuKIH6hr8e8xUjYljCw6mqcijSimqa7G0bwdSAC2Xz57S1A4+fZv
	 sDt/UWSBzUswPLoKJqdBWCB5hVmqQm+yuhonR8Dk=
From: Akiyoshi Kurita <weibu@redadmin.org>
To: Rob Herring <robh@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, Akiyoshi Kurita <weibu@redadmin.org>
Subject: [PATCH] docs: dt-bindings: hwmon: aspeed-pwm-tacho: fix typos
Date: Wed, 24 Dec 2025 17:38:45 +0900
Message-ID: <20251224083845.2727976-1-weibu@redadmin.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Fix "upto" -> "up to" occurrences and add missing "be" in one sentence.

Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
---
 .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt b=
/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
index 8645cd3b867a..d1db4adb2df7 100644
--- a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
+++ b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
@@ -1,9 +1,9 @@
 ASPEED AST2400/AST2500 PWM and Fan Tacho controller device driver
=20
-The ASPEED PWM controller can support upto 8 PWM outputs. The ASPEED Fan T=
acho
-controller can support upto 16 Fan tachometer inputs.
+The ASPEED PWM controller can support up to 8 PWM outputs. The ASPEED Fan =
Tacho
+controller can support up to 16 Fan tachometer inputs.
=20
-There can be upto 8 fans supported. Each fan can have one PWM output and
+There can be up to 8 fans supported. Each fan can have one PWM output and
 one/two Fan tach inputs.
=20
 Required properties for pwm-tacho node:
@@ -28,7 +28,7 @@ Required properties for pwm-tacho node:
=20
 fan subnode format:
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-Under fan subnode there can upto 8 child nodes, with each child node
+Under fan subnode there can be up to 8 child nodes, with each child node
 representing a fan. If there are 8 fans each fan can have one PWM port and
 one/two Fan tach inputs.
 For PWM port can be configured cooling-levels to create cooling device.
--=20
2.47.3

