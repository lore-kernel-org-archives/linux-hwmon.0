Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3CA3D6484
	for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 14:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779892522; cv=none; b=ucjaCWKuVyuZxPdbA+aLQSY+7fO2NwcMk3AqJ2/EbYll0SzfvugMzH0QtFvx2yIYydgtrmPbLrmtAZlTKDvRW8YS8gsMApUoy6J13qQtnWmCS7xiBKQ3G3XSRWnzV1VdK/hkY5739Q7hg/XliFA++xvpS7uh/l9xJ4PsWZFPKyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779892522; c=relaxed/simple;
	bh=MLaGajL0dv5Rl6YmJd3uu1+U4BhprKGs7QN1vKZx0x0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VcZvwXl3IWeXw+I4aNHmab7sBVfLdoUx1Li+75DdJOCEFywMJICUQOu9I9wBLKg5Dd8/8g+8/kIbjIAkvFq6TE52qEezdlnrZResvSTB7pYFqmhzufQh0kvsafXvtGLtHjYD5p7wxxSQwBzpxxrTb9SY6LkcdCqnxXJNLMfBHTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CyfbAFX0; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CyfbAFX0"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-449de065cb3so11599468f8f.2
        for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 07:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779892519; x=1780497319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXHVO11XsXQ2J5E7IFkROjo+IhfcHlRoeu2sTpJXq7o=;
        b=CyfbAFX0HzSL9ZPWQrlvcC9RKh+rZzd2Zn/81/ZGmYUXShubgV7RNX5S/YXzeQdQMY
         2hpiLayvLw7y23VdS9VFldN31CCrzrzg85K5bGQriH4g4hmhltyR3UQ9EU++Qx3cu/EE
         /s6nZDz9kwl3/qFm8/BPb5Y1AMiXjjSFU4juCF9CMYtkrwRo3GqXyNy+5NfD53xFs097
         ksQYBGdwnuq7wOIGq45qcs7Un9BZhEYZDGfv3XYXclWlnlqzB7OWQjbD9z9bCf5/9UPF
         LujE91Gve4ehlJoJAEG7zr2JT69aYs3ZOZH5rVgo8vg5S+k3CwUKlFKMJ9J7Vh3+W/xr
         2wpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779892519; x=1780497319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SXHVO11XsXQ2J5E7IFkROjo+IhfcHlRoeu2sTpJXq7o=;
        b=V2gZOlZ3T/hwMBhizHdUXLbC/WK5OiSuyLdWCYz23abaMb/EZUvqKChCIyh1XJ3jZ/
         g9vqWwdLnOIAo0iLC60hiEFBldcX7U6m1ckinF4/EEQFkFmqXV6XpjlfcnACC44EbSar
         P8pizosVe2bDdx6U0YNLNamTGSnxjcq9UddGAHJgdGVVPxPGlDazOcUEShe+0Jp08Y4g
         fZMiVqJxuBEToZT400GtZGYim5A7oYSpJmFRKBddwwWhYx9Pp7Ut6yvrG9YPCZzOmihx
         KTZOQtUYSHYoDaF6BauymTuUE+Uqz9swxtYwsdRDrt/NqkWL6lIniyk8pLZS50axixAe
         X/3w==
X-Forwarded-Encrypted: i=1; AFNElJ+yg3QORNNavfwlyP+VhnPxuKqOliFeSklKQCL3zE0UEfY3wHJVXxBKZt8Hy3M4xzDM70QuCobunp2wng==@vger.kernel.org
X-Gm-Message-State: AOJu0YyV+etarAJiis/AClCS0Gcro5q+p8eXIk34+VMdQaP37f1A+KHd
	+fTT0Rn5PMW3jr1bdzOi8LsVkVwsJnJFhzVMp3w6HOSeev4Nu73mLyNw
X-Gm-Gg: Acq92OEKwTBexE5e1+Z3CinrRJqJ2m/9W/VGtwqqx7jxELUzhKmPwKS3OeqqQcMrUNv
	SC+Enj9VllNv0AxWoI+yg+UEjgYB1el85oU6o8NaHw94RekHXlSDadwNZFpu1Apz+N5qyXLiXB5
	h+AZLKh/Dk+UBx2LzVD4lNDAVOA8kHbpUycTw+/6WDpAIhG5VPD+y4J3gXe2aQQiX/vwz4MMCk6
	H3HR7nNWy1YLeGyYnLb3VtVIYw+t0G/GT3Jc0xV783jfuvlVnkXMf6oOaQ+3KSuKf8T0O1/i6/W
	DcIw9k73qjaCQMg2tiG3FLaZ5w14175SUtOzhfSAtVNozxACs7eNcIT58tyQU2HiphgfbTXLKBm
	ufDR0Z1Ja2ZoJNxpzmeAhlade5fZZ33Eu47gXX+T/GXxQfJUPeNbZTVah+yq03pk3RJKKL6f/T6
	a75Xzk+QqW0/+tKgA=
X-Received: by 2002:a05:6000:4804:b0:44a:be4:d0e4 with SMTP id ffacd0b85a97d-45eb36ac4b7mr38832146f8f.25.1779892518554;
        Wed, 27 May 2026 07:35:18 -0700 (PDT)
Received: from sefo-laptop ([2a02:8071:50c5:5c0::361b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5584b8sm6239763f8f.11.2026.05.27.07.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 07:35:18 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: lars@metafoo.de,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net,
	jdelvare@suse.com,
	ak@it-klinger.de,
	linux-iio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 3/4] iio: flow: add Sensirion SLF3x liquid flow sensor driver
Date: Wed, 27 May 2026 16:34:59 +0200
Message-ID: <20260527143515.102794-2-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260526174229.7c7414ae@jic23-huawei>
References: <20260524205112.26638-1-wafgo01@gmail.com> <20260524205112.26638-4-wafgo01@gmail.com> <20260526174229.7c7414ae@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 26 May 2026 17:42:29 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> Also see:
> https://sashiko.dev/#/patchset/20260524205112.26638-1-wafgo01%40gmail.com
> It may well not be correct in all cases, but it often is!

Thanks for the pointer - went through the Sashiko output and
folded the actionable items in (bool returns, unsigned ints in
loops, fallback-compatible cleanup etc.); the rest is in v2.

> The value of _scale seems like a plausible issue to me.
> We have discussed expanding the range further than 9 decimal places
> in the past. Seems like this might be the time we need to do it.
> There is some work under review at the moment to allow more complex
> fixed point handling but not sure it applies usefully here.

Going back to the datasheets, v1 had the SLF3S-0600F and -4000B
scale_den values wrong; the SLF3S-1300F entry I added was just
carried over from 0600F as a placeholder.  v2 now uses the
published scale factors (Table 16 for 0600F, Table 15 for 1300F
and 4000B):

  SLF3S-0600F:  10 (ul/min)^-1   ->  1 /   600 000 000 (l/s)/LSB
  SLF3S-1300F: 500 (ml/min)^-1   ->  1 /    30 000 000 (l/s)/LSB
  SLF3S-4000B:  32 (ml/min)^-1   ->  1 /     1 920 000 (l/s)/LSB

So the SLF3S-4000B scale_den drops from ~1.67e9 to 1.92e6 and the
INT_MAX concern is gone.  Happy to follow up on top if the
extended fixed-point work lands in a useful form.

> I also missed the crc table is global. Easy solution is take a copy.

Done in v2 - the table lives now in struct slf3s_data and
crc8_populate_msb() runs per-instance in probe().

> Suspend / resume one is a value add for the future.

Acknowledged, parked for now.  Easy to add as soon as there is a
user for it.

Thanks,
Wadim
