Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DBB5661
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jul 2024 00:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721954615; cv=none; b=ZRTtyxbFuj72uuNI1fs5b1OYLAXjuA2PI6rX9OJPH1QL/sWztLChO18mgvU/yxslK3Xl2WXU0XYcN3yCpX/aEvEwRsk0GAHoQ+QXJisjFlUtOt9P2Jfven5TBIyUOR+Oyg5ajqODOAZ7JybreNO9wP6lIaVnvQAXbmaN3/LT7T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721954615; c=relaxed/simple;
	bh=ff31UV+TtGYtdl2lSzJKggNsypaRv/v+KWzpz2axQTM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DiywcxklZAUYVVCWOrMrCte6TbEjZCyLA0Rd6cdJStwEzxhQSCZiuVHt4wyvF0lKe6aPe/CmXJa7H1yKqJ47odw9N5+O15M7M28DzssdW9SbKfJPu34shoQbcm2ehFIL8jlI1bcIMPLzfxOWwSbnKwTrAqFGUJpZY0uNeoylcW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LUQ0SvLa; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LUQ0SvLa"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-70d2b921cdfso420230b3a.0
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Jul 2024 17:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721954613; x=1722559413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=JLopBYrO1matCVX/WtsDWoA3A6NG/iR37EIaWiybaD4=;
        b=LUQ0SvLaQhLvz+IlbtyLSeox6KOL3W2rYWs5HhO6Bkr7T2XHIzTpE+jP1wV58rAKfp
         cNPQoDUEjEoKVha3V/2sbtNGRG/eXa2sfdHpTmgkD3awqu8ko82l5oqy4Hs+smDEBQMG
         PTD/jsyS9ByhvTbomE6nzXjOrU5viJiUl5PsCa+SrtbzKoaWivphMMeLpFwtw9/rF+SJ
         Btt3YFzYw/yQFRNDXEM8BHBzdzKbdDzXIq3xAuzKliDBCbf7dkNocWpCIEui+vq+z96v
         f9HlncU9LnSiUnxo8aik+6Mc5teG+Vo1gD+HgEz/vVKMB6phzENQKychJg1H3lEo0XT2
         3eaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721954613; x=1722559413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLopBYrO1matCVX/WtsDWoA3A6NG/iR37EIaWiybaD4=;
        b=hSiuqoH6JP11so/Dh8A/5XbnQA4hhOLrTF0NwJ6QNa/cHkEgJv4hp34+6R3m8vXNtP
         gzvaJC63/GfPLJ1PAmUBn5tj3xikMlkAn4bz8hlbgKvD2HcmSL6fzPMCgIQ2ObXhasr/
         VEXv+d6Eyrf3kNMeAdBeHzEVyGYAN8ZChFNgXjjzZwBORbxXwle1l362NXCRhnVpkUs9
         zVfyBescIk32DFYLKfMOwlTCfPxiFAf2F+45TQ2h5xW2xkv4lrj41yO2dJC7UqNm8RYv
         Rue1NtXM4kKEgcGYIvXR+go7J6NtoGm5ApdcvX3AUXVq9gQuYlrFe+vcPoMygloDlfXS
         LVUQ==
X-Gm-Message-State: AOJu0YxKCbZ7f+F13WhupnipD8z8NxugsJQDqvpcy/2yT2OxumkBD0+o
	dl0Q6guwr4vckHoRs0Mzw/AVukLC7nksNU/dAXF62lDVz6gL0A6Poz+wmg==
X-Google-Smtp-Source: AGHT+IHCK6UcYxwUxy5SCixuQblnKOUJMp3YL3tliAZqyARvuvBVwd+1YatHsm+31LMU6DuO2oltqA==
X-Received: by 2002:a05:6a00:1a8d:b0:70d:33b3:2d7f with SMTP id d2e1a72fcca58-70eaa9494e1mr5871616b3a.26.1721954612694;
        Thu, 25 Jul 2024 17:43:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead8751d3sm1685122b3a.168.2024.07.25.17.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 17:43:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 0/5] hwmon: (max1668) Modernize driver
Date: Thu, 25 Jul 2024 17:43:24 -0700
Message-Id: <20240726004329.934763-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up driver and convert it to use regmap and with_info hardware
monitoring API to reduce code size and to make it easier to maintain.

----------------------------------------------------------------
Guenter Roeck (5):
      hwmon: (max1668) Reorder include files to alphabetic order
      hwmon: (max1668) Use BIT macro
      hwmon: (max1668) Convert to use regmap
      hwmon: (max1668) Replace chip type with number of channels
      hwmon: (max1668) Convert to use with_info hwmon API

 drivers/hwmon/max1668.c | 487 ++++++++++++++++++------------------------------
 1 file changed, 181 insertions(+), 306 deletions(-)
