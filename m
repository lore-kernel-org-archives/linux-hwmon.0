Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795193989;
	b=AylaSdjmmthriL1YwlfGfIQMKGDVbmKPB3fpyQ49Gj6wyHDc3HlvVjRRzHvFa9v4ZezO
	 XBVoLmxRtveKWMqVEXdILAVOzl/3F8fgFwPpTkWNLRYVnzTi8VI9MujMIcPL4qvZsT6Fu
	 FdN+UY+0II2AKa+lAsSTsVCh6EKiO6Rn1WHbGNj7R/aWHbAzcV7qDdc6un8ekWVK+UWje
	 0exLzDk1+zT01LqsTmf1Q3nkitHTVNK6w1Py70K4NCltQDJfme0T5J1K331PV6RTAr5hr
	 ICQDbP62Jcdwi1WYGGE5t1sv5JB6YI6eFHjc7S0938klLjgpTPKEfGNhZ5nyLag+M/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795193989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=O8S+yRSGSfrlAkjD3dhQT0CDK6E3kYAaaeOgKnCRES0=;
	b=hfvjQ6WEh29nEm2prTcyxeWXkwtTdpl9ZBvdnfs15jDg7MDoPSPcv9bFks87iTt2tozO
	 iWSuyanHR0EiiOiNQNbBDwtMEo7gSVWXJFHswAypb6SPi8F4XGwzXVwaoCrJO1HHXMGQO
	 lOsOQ8mTICIpVdXExcCmNaBl0J9U+EualmalVH/x+N4TixiLs0s3rUuUIbjY0+WjIH9yN
	 yAX5Cv35cPrYb8mkFi2wxaB9ht59TlcnTvGDo6/8owZG1o6u2wyIajxwnnWpbtpWuYCEp
	 UjI3x71adeaCW1E0/iDch/QHtTirhGJjfBKATXl83Ec7jzbi15M/qR4/7Pezso5jZLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m6BU0MGc;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF47F60A2605
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Nov 2026 16:59:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF47F60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m6BU0MGc
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so10320995e9.2
        for <linux-hwmon@vger.kernel.org>; Fri, 20 Nov 2026 08:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795193985; x=1795798785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O8S+yRSGSfrlAkjD3dhQT0CDK6E3kYAaaeOgKnCRES0=;
        b=m6BU0MGcdDFsz3WbRA2gTKSk9CNBrAfxBTx6CmujE6OCmk70Ot99iutsrU4lwdQl1/
         HgRPqyeuj4Oe5Pjbjnm0Xw3RAFjVpn5WmzvOu0pCNFRd65lQGiqFX8YFWWnP2ShfKJIj
         kGnsN+tcJ7uJY+gCOZNA6BsjO3+LHYxDSfW6P0ZpAHqYnEIXiricwc4GPWhnrdnak/A0
         DYep3ouTGZwh1csxcBkK9K9/3rfVWPw32oSnyyp3c/cxPy9yQFkL9i9tiF4oGPCtGZU9
         gtq4vBx7u08eL1D/Kvwo/PKHe6uED74DOzoF9UBy9cNi0XXTfDAlPu7jfeid3HCNr6kf
         rWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795193985; x=1795798785;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O8S+yRSGSfrlAkjD3dhQT0CDK6E3kYAaaeOgKnCRES0=;
        b=YujeStVqH42jHNTpXuSEQxgHxp7jMJ76ZmGoeoyOvoGxNxfwFoX7qYXj1aygDAR8Pe
         zOyS4nsVDouiJmpO08+VmNiNBsyPMOIzKA8Chhh/NeSOIV5fs6vzKdQRBzYEY0UB8mbo
         fZXqFmDCwDX9T/oyVJ4Z/dJm6SLY8sHnM/8trIbJY7ZSnVvrO1LH2/oliCqyWbMhW5O0
         eH+BBjz4GD21fcKXkamna4XI2TE2ZQG8EzSt8YVddv74++50YK7RlX3qhA4ra/Fsb7UX
         MDhs2aAR0cPZKEn2c15JYLDs6OivQEVtaUXa2wqHYeWuUAFtBsb/K6mh8LVUdpByrsdd
         nfaA==
X-Gm-Message-State: APuU4Z+z3OMRcuGJd2m4lJr1GCkL6BN8WVqGMBraX5Q3gOFQEds+BxCn
	YeT/GkRYC8kR+kuvaZ1LUO06z8UvcRI4qV3Dg8HVNXMfwyzBu+1sBWBA
X-Gm-Gg: AYBFou0LMQ20+5FwNnGaqRB+9E2Sdxn+at0yeWEcG38KgshN+buU7KDs6yoV22OXaGO
	FErOzhDDTv2Ge5FvzWp4Cw5TeV5THBnPH1DGz3DLcfMBjarFMDo0+rYfxIutXWUemCevfZQqL7a
	qz9IDpEmbB8y3wlQyuxkAWkhx1haaieNUCe3EFu2MdK15rMBur44L9H8XTYyaSBcvn1S9WkqxdH
	bwa7YGHl/PFm55ktBJESmeZaXbqmNWw/gEbeSCiA5cFH/RlQ21VV9Ns/SFKc2ITaYyRmf1F2uDU
	VB+lfrOPwcrwlGrGH73AM+DEddtkhrlsQoI+qDQqandXwU3N7TQY8OO0Q5WpHxmKAOo3fhLi2qL
	SMPwcAsvUV9ZczGTaKMppoLPZPJ/jq411JO4BO8PKxig2mDPI+zNgko2TjTzowfTwMk5xGRi0i7
	x9LlqHmT6MS6iTZLYHY9PnU/QWwm9174eeEytH8dtU/7ezskzfZll6uCnEgZFkPFHeTiqGK4Vpm
	v/++84AhqRB2oGav6SOIdsfTDVkYL9vFJnQ9xFH5nuuVTMZWOpVrBg3P1WYab3IEtpnFoBlhqZr
	CkDeCsN2QViBHKzhfRjAVy7a050Di5Zdmw==
X-Received: by 2002:a05:600c:6748:b0:4ba:761:97a1 with SMTP id 5b1f17b1804b1-4bb888251bfmr79940645e9.14.1795193985361;
        Fri, 20 Nov 2026 08:59:45 -0800 (PST)
Received: from CachyOS ([176.88.126.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e5f081sm103768165e9.4.2026.11.20.08.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:59:45 -0800 (PST)
From: =?UTF-8?q?Asaf=20Nuri=20Bertizlio=C4=9Flu?= <asafbertizlioglu@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Asaf=20Nuri=20Bertizlio=C4=9Flu?= <asafbertizlioglu@gmail.com>
Subject: [PATCH] hwmon: (coretemp) Remove unused for_each_sibling() and name_attr
Date: Fri, 20 Nov 2026 19:59:26 +0300
Message-ID: <20261120165926.579575-1-asafbertizlioglu@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The for_each_sibling() macro lost its only user in commit
e1b370b64031 ("hwmon: (coretemp) Simplify sibling management").

The name_attr member of struct platform_data has been unused since
commit d72d19c26c41 ("hwmon: (coretemp) Convert to use
devm_hwmon_device_register_with_groups"), which left the "name"
attribute to the hwmon core.

Remove both. No functional change.

Built with CONFIG_SMP=y and CONFIG_SMP=n at W=1 with no new
warnings. Apart from the struct platform_data allocation size,
which shrinks from 88 to 56 bytes, the generated code is unchanged.

The unused definitions were found with an LLM-based coding assistant,
which also drafted this changelog. Both findings were confirmed with
gcc -Wunused-macros, git grep and the git history.

Signed-off-by: Asaf Nuri Bertizlioğlu <asafbertizlioglu@gmail.com>
---
 drivers/hwmon/coretemp.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
index 96d57fe12de6..75ba3484b1e1 100644
--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@ -51,13 +51,6 @@ enum coretemp_attr_index {
 	TOTAL_ATTRS = ATTR_TTARGET + 1		/* Maximum no of possible attrs */
 };
 
-#ifdef CONFIG_SMP
-#define for_each_sibling(i, cpu) \
-	for_each_cpu(i, topology_sibling_cpumask(cpu))
-#else
-#define for_each_sibling(i, cpu)	for (i = 0; false; )
-#endif
-
 /*
  * Per-Core Temperature Data
  * @temp_valid: Whether the CPU reported @temp as valid. @temp is not
@@ -98,7 +91,6 @@ struct platform_data {
 	struct cpumask		cpumask;
 	struct temp_data	*pkg_data;
 	struct temp_data	**core_data;
-	struct device_attribute name_attr;
 };
 
 struct tjmax_pci {
-- 
2.56.0

