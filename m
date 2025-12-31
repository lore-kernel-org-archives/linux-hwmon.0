Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDB41E0DCB
	for <linux-hwmon@vger.kernel.org>; Wed, 31 Dec 2025 15:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767196415; cv=none; b=ordQFZM3/W74Cp7lMG4MoEpXjLW9XQMkXiTmTOnVKowvYeAu057LB61n5lMZLddgeCQIPnbjuRdPsDRII7GkoXOKs6d1kmGHrt/TfSwdIB4cfKt80n2wMp4Ztys1EYQo1uRQUwi0pn4zft33GutdUR/YZOTY+ceimBeYi362MgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767196415; c=relaxed/simple;
	bh=wVPQqFlS1KNfAjUR7RB25XChNaQHRO1v731gwzrN2JQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OUkAT1PTdddKAmMsHzjGGF6gImt1jYZ2an5VtPc+uO2cFHivjhnUyWa1SHDS7jFMxJ/aJtvZNJd9J0dz+4MtGpdnD+70osGblE9pPGcggIobuoLubZd99pq0Za/lY1yx2qe0dHrkvukDJ3NPQZsA2idvVKjhyqmaSoPd7bWHUNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l1TeWI9p; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l1TeWI9p"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42e2ba54a6fso4715214f8f.3
        for <linux-hwmon@vger.kernel.org>; Wed, 31 Dec 2025 07:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767196412; x=1767801212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WKPCW3kq2pGQN393glGn3ykG333/w2J5nOmNIpQR9DM=;
        b=l1TeWI9pYm4RQMAzKjhI0w1T6Zro7Cs/eTPUJQv3Y+JyosOILqJ9BUvmF7sV1nQGtM
         IzwHhlshIixWjdPPNH8SWoW/Y8bhgVXxW6nKWXkn63MYKgpuwhKP2kviTV/TqYhAbgzY
         J/B23BdVAamQ01mTkhtjj1cXgkC+s9ThjvmZM+QwchOqgtd6bpv0PnNDuA8JCIjFjoaN
         3SzzdHsdeBzWllMhvnMT2w7WUuO50FZUUBD3qNxGOmrTrmXImdb8gaO+iF90PuTY2yM+
         VuIiQPt/Du1baAYdFVD+zJbs0/+a28du9mbAZMRKPK2cLZW8gJObBfoD9iINbmgDGC52
         B/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767196412; x=1767801212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKPCW3kq2pGQN393glGn3ykG333/w2J5nOmNIpQR9DM=;
        b=INpnuhBFnqeFa+1dINeU6yzFTIBg3Tqp7+EQBaFAkA/ybc91T46ovH8VW7cugVLAy+
         zenO8dPjqZGh/aMQunrC6OJPHlBXCQHvt8Z5vGVvx2/vX8HbwAkaaWXw0//QJ+G/eq/L
         /4NaXxnbU4a+MLbkUMgG6y3fhPlepXtD7XilK4n8Vbtx5bgUGmiC9w+KwoSnaTogwdSo
         TFxOoqalSUzw0EGN7DHi3O8h/7ZmYdgNhDBKXwX3XxY0+PEivJGWTgjlXc3+LbNTwp8M
         e2EggDrbeTMkL2YkAkKGfVIbTYzKZLAw6fVsXCOh6XywKz6kGhNw95kL5hJip3RyICVB
         roww==
X-Forwarded-Encrypted: i=1; AJvYcCW0O0bfbvEppvldi6MDoInO8W2n0XmuFJzlCs+fKutUWb+kTGqHM3XjsW/zwAX1uLfE1hnua0J4O8WbjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0mVeVQsNIofMT9dyzSR4i67pldDsSgxji0wDVYIRQsk5/XvLS
	XW6i7xOCube1Nl95kGmUtQ/TcMFebHhIg6IzRU42K0gKr4MTWP63RAyQzkGFWw==
X-Gm-Gg: AY/fxX61kFE7N+ifj2XyVn3xiWYxYnk7I43DGFInaS2KysUg4Wdu6L9qdGdiioOaNtk
	wd70Hd1+O4+exME8xBz69WfN/oM6gRq0IvaDqBEFZg0VceTyjZMyIAaIN/4/pmqk3VJvwKeJ65i
	mLGB1X9uvk12YtfNMSG3M7Azlg4LOevrYKoXmebJPUIdUdn2HUldGWdqa5RpjNUnJ6dr3nF/qQQ
	NPlGZ7yqRri0J6sxXWSsXy7Q56frSrXiL7r3fydh8s4iVjl7JF0sLEKskmIzQ3U8TVp4pcsV3ix
	Urk5wpmrLbC7vNyQA+bMNNC529TIFYOYdLsq+W2Qe0y0rCWK7JyzmPxTm89N7cRiR5JRYLix3hu
	OcIKQbdrVxURbjwjlCaW+lbFyrpptz9g50XjbTalx8w3NtRFusovK0cxJoBxZAEbW9iDrA7wTXg
	XXxItG+hFRRIKkE/QkIQaJ5Yc=
X-Google-Smtp-Source: AGHT+IHF37bruf98WLBqlxj/MZ8UKAdp1zRKcpboq39+FTBtQLAszSI+B0p28QQyKB6nJtVlkJGd6g==
X-Received: by 2002:a5d:4842:0:b0:432:84ee:186d with SMTP id ffacd0b85a97d-43284ee2de1mr16836665f8f.62.1767196411907;
        Wed, 31 Dec 2025 07:53:31 -0800 (PST)
Received: from c101p-debian ([178.137.87.131])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4324eab257asm75530029f8f.38.2025.12.31.07.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 07:53:31 -0800 (PST)
From: Denis Pauk <pauk.denis@gmail.com>
To: 
Cc: pauk.denis@gmail.com,
	shoes2ga@gmail.com,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (nct6775) Add ASUS Pro WS WRX90E-SAGE SE
Date: Wed, 31 Dec 2025 17:53:14 +0200
Message-ID: <20251231155316.2048-1-pauk.denis@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Boards Pro WS WRX90E-SAGE SE has got a nct6775 chip, but by default there's
no use of it because of resource conflict with WMI method.

Add the board to the WMI monitoring list.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=204807
Signed-off-by: Denis Pauk <pauk.denis@gmail.com>
Tested-by: Marcus <shoes2ga@gmail.com>
---
 drivers/hwmon/nct6775-platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/nct6775-platform.c b/drivers/hwmon/nct6775-platform.c
index c3a719aef1ac..555029dfe713 100644
--- a/drivers/hwmon/nct6775-platform.c
+++ b/drivers/hwmon/nct6775-platform.c
@@ -1357,6 +1357,7 @@ static const char * const asus_msi_boards[] = {
 	"Pro WS W680-ACE IPMI",
 	"Pro WS W790-ACE",
 	"Pro WS W790E-SAGE SE",
+	"Pro WS WRX90E-SAGE SE",
 	"ProArt B650-CREATOR",
 	"ProArt B660-CREATOR D4",
 	"ProArt B760-CREATOR D4",
-- 
2.51.0

