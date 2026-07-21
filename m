Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306283AE713
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 09:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627993; cv=none; b=VYadxSUpe/v9Sazy60fb9xzYahOLMAqX8er8HtiTzBp3EuXWoW0D5wZNSfugh2VAxImmmxBdFdwb0Ol74SzdcnjldWJNE+VL2uDezH19NMiUp4XHJbC8cjv2vJZKEBgxzkq7u2DGcZj+5UhJRd61EujbqgxCqNqec7xEFRP81x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627993; c=relaxed/simple;
	bh=AubZwRsDaLot5csF7dYq/1KvYpUc5OiagEGEhDhbY8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oOGgQdb2iPMJdwF4gooVohpNrCyA9mx68B9UL9bl5brICfK1q3CzJfvD/FZcRjdDdpv/mRZ+jabfzFJSdCDIbs27LUe+hZ8vDbiT6SrBmONfwQBjxJKJpf7dXLkgWqBIZKvFs3bEw2sr5N15p4jtzHGLJnKmKMPi9EaHc7/pxCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TtV0JGNw; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TtV0JGNw"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4955de8797cso11708175e9.3
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 02:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784627988; x=1785232788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5bP7FEQ7k53ebpzWmJzqXUez3bdeDukLwJkEZmOrlD0=;
        b=TtV0JGNwVLYzG9uLrxN5iw/+D/zu8WRJNwp9Ly+LXrrHNxamQKg0+xKgYn0T6dDVvq
         2WnDoA4Cshmp3Zsf1wr3V7/yfuDe57il/mqLvD/dxz+ifuj3YKinzN12i6M/XWUfM9Wy
         SD4ydFkul5kNl70+eG3DPzlJCQ2A7H5xeIU/GXT+Kmd66R2/jlZEA12RoiqNVdkJHtSW
         Hc2dO2nDThBqyA7YORfC0IhSYqXJAhRIOOMHCrp1KmzGl6xyhWrD/SS5iygL83LlGdce
         e883Sd0AWCdatR++zTePE7TrV6/ngmU+lP+pEQaUqgI633CXeNzRJAw1OudnesSyBguB
         scJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627988; x=1785232788;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5bP7FEQ7k53ebpzWmJzqXUez3bdeDukLwJkEZmOrlD0=;
        b=bTRfAf7kppWMmnY/aiGeo2Xx01LB5NOvuOWbYxjguoqLkFYTUyieLmZLytTR6lm9Fl
         2jWwALS+Hys+tQ5yY+Q+4ivY4h9nhfQcEu6jyyx1CNk5jvDt89H/sywcG//PM5ExxGF3
         PDh0Oj0Y8pl3JuqZhPw9wmNle6aefvcu9vKu0XclPOvojH6l6usxvTaU6HyneLNJvhEF
         BO20LQ3bVHsFhsAd10amEa1Rqg8uU0YRX8fO430JTGGGBPzOej12b8nEFh4pTaBXf+bm
         MInqz38nl+WZFsND3IPsap+YYNJAz6VuUvd+Qs3fHEy7v/0E6svGObMqEsnnwFAm2lpT
         u1OQ==
X-Gm-Message-State: AOJu0YxhygS6llOC98bQIn9pNWerWd8SX4yR82uYHx16YVhjko6j7RD6
	YmU3b/8wypYj4WJLbUl9ATq7IJaCKGK0IHv/KuK6Cmsy+ouJG6TyBzZKX8v72w==
X-Gm-Gg: AfdE7ckcdc84zMpqnLdrbS4cn6i5GpKNXYeM6JHKnDONgSHQLFIZ2h5NbUO7vsBeHNL
	aPHP61KTZ6T5CbRlHTeNdudkuRXq6MNZsmxt/RWV+JdKW19+sjrcx6bpMYLQl11XCuS7y8xHXbi
	0xaGqiQhrc5UI83vlToQSQigtUOFAhw/Ao2vgbej33KRg/qO5kZrzst/GHL6orKTV+Li5xTLygV
	jTC6jj68Yex9rOKLUaWnmD99YOu6dkyOIWnbLkkd7RF+OCFFCFxXGdCGvccoCsb2pgGtgE6cuvs
	nkBCk+a5TOW9edvrJu+pe7b580fH4xfqoqqDFQjlhW/KTMCJqhnI18c0LtIofoGCSysxRXtaBcd
	zxVzBTiKrkcR76qxAinCZuWpI40yDNKc5v0dFblNaLjbO0AdXeVto+TOsyj6KnL+9ZpVu3vCYTV
	Cdqo2yRjnOS05clRSkkt80Am+Vmo4YBaMByA==
X-Received: by 2002:a05:600c:3143:b0:492:7142:f46e with SMTP id 5b1f17b1804b1-4954a3d0cd7mr209723365e9.2.1784627988145;
        Tue, 21 Jul 2026 02:59:48 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e499c2sm35228691f8f.4.2026.07.21.02.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:59:47 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] hwmon: emc1403: Convert to use OF bindings and add regulator support
Date: Tue, 21 Jul 2026 12:59:32 +0300
Message-ID: <20260721095935.439174-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document, add OF and regulator support to EMC14XX thermal sensor family.

Schema file was separated from LM90 since according to Guenter Roeck[1]
these sensors are incompatible with LM90. Proposed schema has basic
hardware description. All registers Guenter Roeck mentioned may be added
later on, when/if driver would need to work with them. As for now driver
successfully works as is.

[1] https://lore.kernel.org/lkml/a0c5c1e8-9a36-4835-a5d9-7bafda79c36f@roeck-us.net/

---
Changes in v2:
- schema separated into a dedicated file
- dropped chip id check
- fixed match data casting
- adjusted regulator name

Changes in v3:
- fixed number on channels for sensors in schema
---

Jonas Schwöbel (1):
  hwmon: (emc1403) Convert to use OF bindings

Svyatoslav Ryhel (2):
  dt-bindings: hwmon: Document SMSC EMC1402/1403/1404/1428
  hwmon: (emc1403) Add regulator support

 .../bindings/hwmon/smsc,emc1403.yaml          | 203 ++++++++++++++++++
 drivers/hwmon/emc1403.c                       |  23 +-
 2 files changed, 224 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/smsc,emc1403.yaml

-- 
2.53.0

