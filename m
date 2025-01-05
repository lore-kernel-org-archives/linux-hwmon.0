Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1F214831D;
	Sun,  5 Jan 2025 19:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736106944; cv=none; b=grrV3Jk0BByrZjscaZBMSNKvWTYZXxDgVZ4Yj8leoU7P928VY2q8Eo+Mb0dYI1aDFZnYACI0GtXtGBn/HshjlzQx6+yde0fCEmRYhKxEYWd9Nbl2wTfWQLjqX5v7UZsh5mohBakmGLPelGDtYgBZCEC7cSyvZ/T2Sp5YwzrA7GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736106944; c=relaxed/simple;
	bh=R/rM4p21AwgLZmBF8Vwn641TqXCw5NU4zQLGi0E4ELY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sk2LwrtHxEX4LwHK2rnufEtzoznYuJ4kNp0QxDx6L0bEd8w6HeUaPwXzYo7PjSAdz7JKe149X28gE+02mkdJR02ardi6NotF+PNSwcvbXQNCu2So36Zle5uYKY3tKNE5jA/h8ICci51Z8Bx0xjrt9pEOo56ZQs/rOsFPSQpDRIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OHzdnLSw; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OHzdnLSw"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so156714145e9.0;
        Sun, 05 Jan 2025 11:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736106941; x=1736711741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1snJbsHlMZpRuEGs+ODUJs3LY3gVzN4pk68xFHq51ZM=;
        b=OHzdnLSwfH4SHYJsVIWQxjJjaBa6TLvqnoTLFwy2RghVVSP+r/csLu8eFE4DE3GikI
         10+m0aPYAfki0bLuRvpOUGpFwbQ5LNHKZ1XlaQ3QYl/yyynx7nZDvPT7GOmE/OVn21xL
         ajBPdBLR0bO2AncQDmvTq7HAdQdLXbV67zlIx7/os41HmTohkdK2YVtmPgYZgLBKk9dz
         lVUD3Z2/4TL2znpdBh58AhwSzECIfJ0IkumyZ8nl4sJfFxTcGUN3YK13gwBG+lIQu5Ll
         BEC40QlYd4OA0grCM09M3w0LH5fjw8TOBGsuFfND5sc3I9ac1tC6hR8hSc2bCaAbPDf3
         qA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736106941; x=1736711741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1snJbsHlMZpRuEGs+ODUJs3LY3gVzN4pk68xFHq51ZM=;
        b=WlFAO3NeH+TEBZ5I3XtSx6ySTTrT7c3ecTLA+Mdr38MtUO+J/KRsBbxt+dKQNs5Wpf
         poXeOd0r06/W5VsTXlnWCcgaKdS94NXUZ4ykRHg/uIa8AI4iIS9obIbpHVvWbwsFF3MZ
         P2n3b3Hwyoo+Fi6jMbDQYcRCuTayVi/KYJgsVrxQAcohVKfUfndhphu6tgacgepXDIIG
         dhkw/T3x4ozVJuN8jT7VFyBrOh2XAx3QPg72mh2tmOg3nKdP77zdAR82Lvh9kDTUzSHt
         cjWD/jL1o54eHp7YWiFxKMfUzSM3s1miDz2Ao/3WXEIRNOqJFR8/2zKVGOm5UG5dOHRM
         e/kw==
X-Forwarded-Encrypted: i=1; AJvYcCUuCYzJm5vX0/I1XTXNUtzQAfqhjPp/I1x24on3gKixIMCAyWr7ri4wRJZPzpcXmSsmJETIQbU51iAarw==@vger.kernel.org, AJvYcCXwoEQQmtfcRDIRpodVfwepDpeYcevMUtGntpWwbHo7Uyxcw7kfnHJx0SXg/pvkqky1dbGoLQQV6vOUcH7u@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+PjH3U/3NiJ2Kc70qCat9TEbTuyihw0YMX419TEWpbIWCkq5l
	M5Y8ry88s+FmMBHCioQdDP5M9mIpc/k4zUNnAITCz9KFtjuGPNYx
X-Gm-Gg: ASbGncvxj8dw+c1ZwA/dOKXFQpaN+6oEHOPAauKLOqq/vkAl7tx13JQFVaQbqF/dTSu
	bzx4L9xgN8VVhbhwkE2vUwxjvcr9hGUp5Z31y9DBAQbt4dYYzsVToeSlx3mG1YFUqQMdrzvye3f
	DwsJ5d/o9B+y06uaunCQ5HOPjIPUdQZoJRnjpdfflQIi2QKsSGmnqeD2c/43dzBRKxdTyvFKn+w
	VkWDYurfxSazzJrZKgtV+cUd8YYJ+Ulw+sfzOHOJOFAY/riUzeLYKEMsfqe
X-Google-Smtp-Source: AGHT+IGF3zssa5YIBfQ42l/V+KG+0Tfi/LKeK2zzQFoJVcfRwQM4QlBtFnvMuQIShoRrOZu02RvxZg==
X-Received: by 2002:a05:600c:310a:b0:434:fddf:5bfa with SMTP id 5b1f17b1804b1-4366854bfc0mr435421755e9.2.1736106940795;
        Sun, 05 Jan 2025 11:55:40 -0800 (PST)
Received: from dell-f2yjyx3.. ([185.32.209.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b1143dsm577778975e9.18.2025.01.05.11.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 11:55:40 -0800 (PST)
From: Adrian DC <radian.dc@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian DC <radian.dc@gmail.com>
Subject: [PATCH 0/3] hwmon/adt7470: fix 'fan*_{min,max}', 'temp*_alarm' and add 'temp_fan_norm_alarm'
Date: Sun,  5 Jan 2025 20:55:13 +0100
Message-ID: <20250105195521.3263193-1-radian.dc@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adrian DC (3):
  hwmon/adt7470: allow 'fan*_{min,max}' to be reset to '0'
  hwmon/adt7470: resolve faulty 'temp*_alarm' values read output
  hwmon/adt7470: create 'temp_fan_norm_alarm' attribute for 'NORM' alarm

 drivers/hwmon/adt7470.c | 77 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 72 insertions(+), 5 deletions(-)


base-commit: ab75170520d4964f3acf8bb1f91d34cbc650688e
-- 
2.43.0

