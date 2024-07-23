Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790071534FB
	for <linux-hwmon@vger.kernel.org>; Tue, 23 Jul 2024 15:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721749493; cv=none; b=gMpMgaaJLKgYDqsg2Epb1ttF3xhesEFhb6E6FKoVnAsx14ivayq0d4H/VZo6PrDQHGYPkhkIn6p3dnX8cv5C6o/Ha6VbHeYuJioKp3PnUMxfXHiMXbOYrAAaFPitOHI4sSz0dKwH1goINwrRhBPOt5R7mmnixArc0pUdQDyp3oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721749493; c=relaxed/simple;
	bh=JOPH65BayLx7ctQLqgRX2XknEuDc7HL/Ng8DqUNpbkQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KSsxxBCekCx4nfalPY9V90MfKaZhlcp1IkoLEgrgGWzi3htH4xYkjQ5vs08fxKNYh4gpqHxWfIQIrARwLheOs0HzsCfDEKzOlO15NvDibg591tGt8gnqSncx0nD0TUstbsnngb/fTa4vnkwVJCA1B+piWH8zvf0tKsGJDgckRgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pq5oeAjq; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pq5oeAjq"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70cec4aa1e4so2807733b3a.1
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Jul 2024 08:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721749490; x=1722354290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=LZc7E8gqn8D05AvcE/2u2mhsnEUlTPcQgHeKWunfu5E=;
        b=Pq5oeAjq97S4bl8q4Ph2i0yBVESe1IRb3dKp0+kQVVOac8nVfO7o5W7yy4nNJbuD8l
         HaBhZeF2kT39i6OmW9l4KZOikR/clsPAdVznQP2eumuXSUzIEG0DMoHptJXgSOuIBKKl
         4UlOqfhXcN5R/Zy2v2wh4D4gyMWCNBYeBbXuSB0UQfLjd7WqH88i9e30jCXaUpY+CTZ5
         1miSn+mIgCkqrbRSSiKZxZzw6WSym2Pqq2BOkR0sazJTPNDorrMYMpzfBL7ghHkOYZtj
         7NBsfvZ4+1fWqCZnMnzANzOivYnRpgowphCrBBeqZT4yuyTqX1yzBVzo+PwmQ37PeMA+
         LakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721749490; x=1722354290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZc7E8gqn8D05AvcE/2u2mhsnEUlTPcQgHeKWunfu5E=;
        b=l/0lsW1C7UNmWPhNtrEc347xyrRUtDXrLibAxfzGzWmmsEe8a6/dSPS2+gosbakruo
         8BK+bqgAIDWB8nlKL5jp8rh868I45xmmkx6GDl6jTsQTrduNskLTLM8bsIEQATZQ7iX4
         UY0ruItXpEFGovVoU1hBU++/1iSrAkk36QDXTQs/Fdrxsod+yxbPFeVTp1ZBxtUpaFaL
         3JGtmfsiE0bFHhhK1qeIei7NxwiZUn120JJ50nPrxKYCGjdhipnGeMgAfOt4wkmDbIpX
         YWwHygaPG62Hg4QuhN/r0V39yqrXxr5q9yNHa7jxplgTUloDy1oCz8ktiiKtrzmP4Zwb
         cd9g==
X-Gm-Message-State: AOJu0YwJqvJX429n/Qyaa5MUbhTIb4SpZPaaI/7saVQ7/5tcBYXerLUz
	bXzEijjXpgGdhJPMCJ4hasZP5FTgrL+G823Nm8UavJ/odEWeAFxAc5tvEA==
X-Google-Smtp-Source: AGHT+IHRyH3PEVkJ3rjxNtyw+ssQPHG/SirYROGqA56DZggticrLKTyS4fLvWt77n/EvMRzbVsGPfw==
X-Received: by 2002:a05:6a20:4315:b0:1bd:18ee:f145 with SMTP id adf61e73a8af0-1c44f7461e3mr4172029637.1.1721749490259;
        Tue, 23 Jul 2024 08:44:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-79f0b9fe2a1sm5533333a12.39.2024.07.23.08.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 08:44:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 0/6] hwmon: (max6697) Cleanup, use regmap and with_info API
Date: Tue, 23 Jul 2024 08:44:41 -0700
Message-Id: <20240723154447.2669995-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up driver, use regmap, convert to with_info hwmon API,
and add support for additional standard attributes.

The patch series reduces object file size by more than 30%.

v2:
- Fix include file order to be really alphabetical
- Fix devicetree configuration
- Add Reviewed-by: tags

----------------------------------------------------------------
Guenter Roeck (6):
      hwmon: (max6697) Reorder include files
      hwmon: (max6697) Drop platform data support
      hwmon: (max6697) Use bit operations where possible
      hwmon: (max6697) Convert to use regmap
      hwmon: (max6697) Convert to with_info hwmon API
      hwmon: (max6697) Add support for tempX_min and tempX_min_alarm

 drivers/hwmon/max6697.c               | 896 ++++++++++++++--------------------
 include/linux/platform_data/max6697.h |  33 --
 2 files changed, 370 insertions(+), 559 deletions(-)
 delete mode 100644 include/linux/platform_data/max6697.h
