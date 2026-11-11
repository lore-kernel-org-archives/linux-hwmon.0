Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385734;
	b=SzWGQQitMjxYoW0HTd3A2tQLdvHFhbZymuOlO1vPcMls1depTTcpjANtI/WwYVqaGGHJ
	 ZOHhS/7qDDtKuX32IfSHZ2CuSZUfyGvey8KNP5OjMRH/OyBbIkAeb/XN4ykCzjZaoBbni
	 ytoU6j5DxDiZ8XXQTC16urF4MaSBp/hOYp0h4Xsi+GRTSmRiABBNTOd52guWoeej6bikb
	 l5qMWWhcg191BwBayxChcpKorcCQzlQIOlc350MlOsbsxlE5LefjtrJDAbr48Z6bRA+5e
	 PsDZ8Nbbc3FOnciZCBCSlq1pro/ukejHoe/G4QtFqu9TNwvKoVtvdFOAZwaJvwrMwhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xkjrXuB4d4ljrfRsDmNsDtP89r5+rOTxD9wMLbDcgl0=;
	b=PPEAh0dkBXTnUOtmBVrS79NvPQIQaPEPgre6R0+1D7A7VXxwXWbaCcj/1ELDysJ26bxm
	 74waLmK3v/N7EF4Oe0gAX/xjNDxz515x9pGhx+VJOaRG/VH1MiANq8Vy2PzDHqQvH8EEF
	 OLPGjbecs6z+AmnhXnSWKjg2Z8nlxT3k8cgVB3r1cgIJ3V5A+RTr8KI9aC6M61D19FG2n
	 l6+5xkDcz6lXDF4EJBHZnB7fWx2fAEZZK0Nj+37i/fotOyS5en5o9HhHej1GxRr/kPCcu
	 UZ/ZswuutbNiB2cDiDN8iZ1/Zu49FCp9BdIursvUM9HjJQFg0zSyO4+jSVxprrC51SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DOWAkC6h;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE6B60A262A
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 08:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AE6B60A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DOWAkC6h
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c468bd799ecso425375166b.1
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 00:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794385732; x=1794990532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xkjrXuB4d4ljrfRsDmNsDtP89r5+rOTxD9wMLbDcgl0=;
        b=DOWAkC6hgpg1Li2Mi/aQy7d37STcbrFU4fyKJJrm6pxGdhkp2rd2QiWZbIgT1U/KJd
         41OFuznqeDGdJ87PVMnvqZxo7+Ot/TTT8lK2Fyf+OqOSoVpxHTFbWJd49eGjDRM0E7O2
         2mJNQgRyQfSb52el1kVNDXM9Qxuputc3B9i0UwaTIBiB+q9Fo4BrNc8CEI/ua0ZbGr9/
         5BCvvgFdQZlnX9aZ84kYca9P39vjq10Cfi0sfFc2bupRb5zMmidrbL8fkdl5I5BAnqyz
         gwEye5c8xpc0MYFgLyOX8Fa41NVUrhZmyecp7iVH2rzaHALupoqbDLRAz7JsaHQOQ2/T
         IQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794385732; x=1794990532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xkjrXuB4d4ljrfRsDmNsDtP89r5+rOTxD9wMLbDcgl0=;
        b=YteZ73ejVCrGrzP2NoyUu5GgquNURoMEZlyCXGGBN5rnN78k6dXU8UfdG6/U/qyJjR
         PidDfEAajYKNVFaFlTXJSTN3895pbCp82Q7z5rEhREt1cHZwEFP+BfKL5a+EYxcMY0QT
         LJ2FhVRLlBKDCzKZP9OfYTnNZYAtM5XvZ0xVjEIToNvRWUyBxNhPc9RJvHgYOuzLKJfP
         kzHVb/MX4wnPPiRoF8sPO8FnDaZFWGmEMx6U9AFo/lFvwzsSVMKStRFDFbqWe4iTtLPH
         pavkUuDNHS+obCTYM17FDqFflGwt7tz/qZoeyB+Ue7H3dn0qLH3Bw6XjJAlE/PT/yfGl
         vV9A==
X-Gm-Message-State: APuU4Z9cxHqGM0h7riaXJerxqusXoPMgcwLGdy+baDYxn2dUhrFZLuKU
	MRND8G3u/Y6a28PbZfIOCLpQ+ORDO84gU/FBAPJ9cS874l3BAS2bch+2
X-Gm-Gg: AYBFou2761LiGUGD11EJdhv98bNahixcJ4FUiqX0sDB6nKNLglTfwjH9/BTKKR8Z/rU
	Gs/02jnI0S42Eb34FtwaN5kgMHkEdKjkT20dnr9q94csL5PcTIQiAwsEG9oaKaO6blTY8huiv/N
	/qEg4VcLiWdkRKirTFoRoYCE4WVzT2k/zrOT1CNL7mFvAwr8ZCgDLLYOEsIas7h8D8UIFM7yPq5
	k8tV3mh31la+NU9ewOPpQEUfKksE2wFWi1i69m1SL5zXt5YBPU2fv03Q5FwsZTvixhil4FMX5YQ
	3vkNydFuThaWjY2e6JSnfvWzgzTNTMT2cNFQirP57vZ1xbchS3L8OJCqyXn3yraKFCZYGJBWgVo
	zlmdWyyR+tg+h390e68HTo5dZLhXHI2r8gXdpvHms7124VixI1zUMa8kLIzoza606wzgKRVeBLT
	MAOpHAueIFMW7Be5ltLjMMrAK0VI65LEP0dPxhv1W1MbwPDlP+ZMIgnqxgj+ENAuehFGrsyYwAv
	EufYABvthEIJ2Gnc1IfTjEoRhIsNKMUC37vCMvB5PSTciwBJKv/uAjB0djTvDqIUJTt2PBaCFy2
	syhddj01/8/TEr9fHX8Ndabjla47Em7ioa54yDuAod1WfXTlxwza+Gl1PwVg0Fm7tRw6ldeb5Gh
	dSWHKOVQZKsQHG2b1SViX7Bzo/qZ6keASq9hHaPNc5q7CKhj+ak9qt0xJJOnV0D8HAAVWFdV2HB
	Ee5OOd6HLB/G9dOQN7w+sN5XUNHAKQMBLfae1ULw1wVFzJ
X-Received: by 2002:a17:906:7955:b0:c41:53a9:c65c with SMTP id a640c23a62f3a-c5066b65a54mr108933766b.34.1794385731913;
        Wed, 11 Nov 2026 00:28:51 -0800 (PST)
Received: from fractal.tuxedo-gray.ts.net (c-78-82-25-228.bbcust.telenor.se. [78.82.25.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a56ffc7sm210135866b.17.2026.11.11.00.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:28:51 -0800 (PST)
From: Johan Dahlin <jdahlin@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alwyn Kik <alwyn@kik.pw>,
	Fabio Baltieri <fabio.baltieri@gmail.com>,
	Hamza Mahfooz <someguy@effective-light.com>,
	Johan Dahlin <jdahlin@gmail.com>
Subject: [PATCH v2 4/7] hwmon: (nct6683) Enable fan control on ASRock BC-250
Date: Wed, 11 Nov 2026 09:28:35 +0100
Message-ID: <20261111082838.1418051-5-jdahlin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111082838.1418051-1-jdahlin@gmail.com>
References: <20261111082838.1418051-1-jdahlin@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ASRock BC-250 (customer ID 0x162b) has an NCT6686D with the same fan
control registers as the B850 Steel Legend WiFi, and manual fan control
was reported to work there.

Enable fan control for channels 0 to 7 on this board as well.

Suggested-by: Fabio Baltieri <fabio.baltieri@gmail.com>
Signed-off-by: Johan Dahlin <jdahlin@gmail.com>
---
 Documentation/hwmon/nct6683.rst | 2 +-
 drivers/hwmon/nct6683.c         | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct6683.rst
index 026515c35243..8e5cd1d7dcd2 100644
--- a/Documentation/hwmon/nct6683.rst
+++ b/Documentation/hwmon/nct6683.rst
@@ -59,7 +59,7 @@ fan reported by fanN_input.
 
 It is also supported on the ASRock B850 Steel Legend WiFi (NCT6686D,
 customer ID 0x164a), where pwm1 to pwm6 control the fan headers reported
-by fan1 to fan6.
+by fan1 to fan6, and on the ASRock BC-250 (NCT6686D, customer ID 0x162b).
 
 pwmN_enable selects the fan control mode:
 
diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index 29fbf438c04c..f656b84ee8ac 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -1540,7 +1540,8 @@ nct6683_setup_fans(struct nct6683_data *data)
 		}
 	}
 
-	if (data->customer_id == NCT6683_CUSTOMER_ID_ASROCK8)
+	if (data->customer_id == NCT6683_CUSTOMER_ID_ASROCK8 ||
+	    data->customer_id == NCT6683_CUSTOMER_ID_AMD)
 		data->have_fan_ctrl = data->have_pwm & GENMASK(7, 0);
 }
 
-- 
2.53.0

