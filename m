Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C5E31AA87
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 18:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462599; cv=none; b=Jy8KbN7qOE+n0+yOnxyGNy9eJF/aojVyEXRxBRvmCftFEXHnQAK6/qr79nem6duLXVRbT78yyOArA7INzZ5zpEjzOCi1eT2gtmTPhBDsWIOsspJYkTMP07BAz9wKJyXcsN6zQ6BjJvP01MuyuYe7utH05wGaa/eDjSxen2A+dbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462599; c=relaxed/simple;
	bh=VBcDOjJbQ90GYrfNeKOVj+qWQAF0n1uVlyMsseIybXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AxJrzLpHuh193NOPIyeoPHStsIiD4TUHJ00+jcqX1IE9R8zjbjFmaj/1HnSb4ywZHTVc69PvOxs+vJREg1fCgxzpLhxm5ADmY9cgHEz4lEqc1Und1QRGjjkVjnmwn6jYk+KDvzt6p8jSPrnNBHbXBVPFytZ+VgjZPAjDO+1mdEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J13A7C/h; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J13A7C/h"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c73e9e4cdf7so105842a12.2
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 11:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774462596; x=1775067396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=J9Qd1xw094dbFAg+vflOfYWme0dtFl8i26XBAAPULKo=;
        b=J13A7C/hJ0oFs5+c7sXRUXcsuDJt9UZPIUStJRlCBpL55zhLq+ty+pDoA98xc4KCQC
         cX4kiHA1wtpbaJRep8JPEYQ63Chndpye8RHWdit/0RK3Xo9mnOly97IojJnaPK8XQzF2
         rtdvb3LGJO7c++eCm5Zp/FD7TSxrKXiMxAMbb9Kh8TVbuP8FAVp6MPvEok/U7x+CXEq8
         56arPsb/nmuQGOLf+GmSh2PubeKffjJZlOmR6Z2QLt8ym66/Xu+W2CgEg/BnZ0EHkwxi
         8CGabEvc04T6wxSX2r8MMV3/hozE75W6hYVhaUNzWKj3dIGAIFzy8s6TVk5dcnRlCp5V
         TXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462596; x=1775067396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9Qd1xw094dbFAg+vflOfYWme0dtFl8i26XBAAPULKo=;
        b=m3+AIEsd59nvc94L2k2rtDdKigKDQ5YYAXRJ0g7LhVQ+sQtLPzcyxHKCcuhrkEQLHp
         83cSjIizgA5NgRQh0TERStW3TtKFOoiVM22zACShj60qaZtnUc/vVZbTQT3GiipV5a1a
         8EkF25ZikZ+2Za0bq4oQIguoIRwEBAE7UZUfLCRCOG52KR44cqd73CN7wg6EQYM4syny
         EulyaijdJKtKHu6urhFlgRbC1Q+FNS7dnzasYs+vivaWThrg3Vv3nVg/DcCRV6Nb5lqa
         FuwD4DAcxX4vXQLqrkRvzXZF4gxQk0QgYJKdR6jmr7MZSv2cuEisX6PQL46/hz0Id/h8
         PfMw==
X-Gm-Message-State: AOJu0YzN8uCcQ770qhTEoHNT8KmvP1CmTgJij/nKmHz1Gmi/jV+M8/h2
	xKoHnM3XjAz2e++eoVHCeMlzijOtII3BxJCi/T5VZUH4mU4LXdlmCGQnXYRpbg==
X-Gm-Gg: ATEYQzw5lqbQM378btG5cXUy5JiZn6Aghw8/fGFZYJUjQ4KgU+EDRNYzyGAXRrB+BKj
	xXK5Nby2wJ7S+gzM140SV9J8Xf7LHjYly5R+Pi5g8KJNVUmWYWYcUN6havs/NH0LI9fl8+b1j58
	tqXbioSRcR0HlDpfOTjyT6FU3IhduTlR5JYTdsxZYazGN0eGN1rRnv95vTfozfqPk+JLaIbFAuL
	Zp1Flp4aaMf7TIez5eaTtMClMfm7vPud/siiiTPYu1ck3zB8vUbttJNluFNWJ6K2MtzZkotH5Mp
	OID9UYwIU52zJ+oQNrHK99DAczatLirAVqFYO+b7AwmuBiEBPLvtmFxVsipfHKixvExlRfG8WvR
	d1kl0n5EYcWwnkpnpcmaE3EMql1E4KQPyGDDv/99LFwkoVEnKjnTETEbem8UU+4vPoItjH/jbVA
	lcCoyhGqPc06wiRcvlQNsyBwqbw2KGzoM4fQqA
X-Received: by 2002:a17:903:3ba4:b0:2b0:9aa7:9494 with SMTP id d9443c01a7336-2b0b0a8c428mr50331795ad.28.1774462596247;
        Wed, 25 Mar 2026 11:16:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc8fb099sm5035475ad.72.2026.03.25.11.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:16:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Sanman Pradhan <psanman@juniper.net>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 0/5] hwmon: (pmbus) PMBus fixes and improvements
Date: Wed, 25 Mar 2026 11:16:26 -0700
Message-ID: <20260325181631.17259-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first patch of the series marks lowest/average/highest/rated attributes
as read-only. Those are values provided by the chip and must not be
modified during runtime (if that is even supported by the chip).

The second patch adds support for write-only attributes. As it turned out,
reading the "reset_history" attributes returned random values. The code now
returns 0 when reading those attributes to avoid ABI hiccups.

The third patch adds locking for regulator operations to avoid interference
with other PMBus operations.

The last two patches introduce and start using guard() and scoped_guard()
for PMBus locking to simplify the code, especially for error handling.

Change log since RFT/RFC: All patches were tested with real hardware.

----------------------------------------------------------------
Guenter Roeck (5):
      hwmon: (pmbus) Mark lowest/average/highest/rated attributes as read-only
      hwmon: (pmbus) Introduce the concept of "write-only" attributes
      hwmon: (pmbus/core) Protect regulator operations with mutex
      hwmon: (pmbus) Add support for guarded PMBus lock
      hwmon: (pmbus_core) Use guard() for mutex protection

 drivers/hwmon/pmbus/pmbus.h      |   5 +
 drivers/hwmon/pmbus/pmbus_core.c | 373 +++++++++++++++++++++++----------------
 2 files changed, 222 insertions(+), 156 deletions(-)
