Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45771132813
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Apr 2024 21:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713303303; cv=none; b=r1W2szOg8RxRDhWrZoySuinLPkgfKwpvaQTSlxDcTdeh5a71txtGXrnPpjT27BLevkRg0cWij4w+RQVGeabTovLhljLqqm09XEncS4xEAeyOJX/YsgIf+FgSba3J4BW9D8/WSCru8sn48rbCDseF+rBXevp5SL6KxsjFsunzUL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713303303; c=relaxed/simple;
	bh=AbGUTIr93cIZBICMTdcgi4m66F6R94LZwRvkAx0ybN4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=EuwmpCbsizFtwpdsnTdT131zBPamiyrdHEgNU8Im/4tNdqzacM9z3GTPygMA91b2l4JsMhrUSY2CxpChWrPm2d5po8sLoJ7emuLG2shzA8KC/NSZYr2VHVxkLlIyWcJ54YyFn5nexBodnRmHR+VnwIQ8uMThwd/L7X1oykahOvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net; spf=pass smtp.mailfrom=iwanders.net; dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b=X3BX3xxB; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="X3BX3xxB"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4347e55066cso19039461cf.2
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Apr 2024 14:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1713303300; x=1713908100; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AbGUTIr93cIZBICMTdcgi4m66F6R94LZwRvkAx0ybN4=;
        b=X3BX3xxBdfZyLm2Y7uCzFrunCUEdaIQJYFUNYrgsuZV0URPn8HN6hGiaZZ6r1oJT0u
         Utge9fWhUY4s7yOVYneuf4Fz14j0ZcE/RLTuDzu/jVRRzodKavKPDEhEH6au4d1sDovN
         t98mjnzqZWWanHx2WCgd4uHfGskwTtsEPatls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713303300; x=1713908100;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AbGUTIr93cIZBICMTdcgi4m66F6R94LZwRvkAx0ybN4=;
        b=SJa2w6DWqGbowgFjbF+7BQsz37rrrP40Ojp2TLN611Nl1B3VjfsBSgEzdq1FpcTmiD
         IZ4o4K9iT8F+X7hY4zJrsrQLg60XFySt7lGk/5lLclbvvA64E9n1Pdg0YnokeTQlp8o+
         6o9a5nzJwKWKuA79X81ZmsUTReB7KSJdrgFYOhpxlm2Ko3/YcB966dWUasPCQK3F2ADa
         OiyQW3XtB7ZBGNpi67j04G9CUGV5iM3lA9HPkN3sW1kEEzCTjhVgJlPWKT3rjV5iokTC
         KVLD1+Q3CX5m3TQmloHvoJZ/3BRFFn9bbE/kXkxmhFOd14OBppob5MiLELgaynMZhd8h
         nISw==
X-Forwarded-Encrypted: i=1; AJvYcCX9hIXPA1xHgsH9NstB55yT3t7ehQ7wLp8UqfP1JcsFKgHh9ZAwOJR219HePvauk5Xjh2s8UXlaoRPlNFrMDM4jZAYHP3yPjCq3KeA=
X-Gm-Message-State: AOJu0YxhYDh9rC7vDuxGJ2Fs0FXUrtEPr+KMvF4fbUtPPoO8Uka3FXqH
	cg15d/l83GUYmy0zGhA8z7LfwrMPymIU9C4bmEYPoin+6+Fl+jQfrYZjoIzPhfs=
X-Google-Smtp-Source: AGHT+IHDjh9+d1ObR8Ij8WEXEfjPgBM7QNiW7UwML0UelHwkd95ejcMfHejXGyIypHi5JcRJDdmBKQ==
X-Received: by 2002:a05:622a:40c:b0:434:8f14:d24 with SMTP id n12-20020a05622a040c00b004348f140d24mr19186828qtx.62.1713303300063;
        Tue, 16 Apr 2024 14:35:00 -0700 (PDT)
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id s11-20020ac8528b000000b0043476c7f668sm7566740qtn.5.2024.04.16.14.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 14:34:59 -0700 (PDT)
From: Ivor Wanders <ivor@iwanders.net>
To: luzmaximilian@gmail.com
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	ivor@iwanders.net,
	jdelvare@suse.com,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/3] hwmon: surface_temp: Add support for sensor names
Date: Tue, 16 Apr 2024 17:34:56 -0400
Message-Id: <20240416213456.3214-1-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <97d0f68f-63da-4f72-ae8d-89fbf9aadf62@gmail.com>
References: <97d0f68f-63da-4f72-ae8d-89fbf9aadf62@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Ivor reverse-engineered the interface calls to get the sensor
> names and wrote the vast majority of this patch (I only changed some
> smaller things and gave advice, hence the co-developed-by). Therefore I
> wanted to give proper attribution to Ivor for his work and not squash it
> into a single patch.

By all means squash them in the next patch revision to make things simpler
to review, I don't think it's a large enough piece of work to worry too
much about attribution if it makes review more difficult.

~Ivor
