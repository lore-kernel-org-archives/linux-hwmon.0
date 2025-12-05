Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2606C2FF177
	for <linux-hwmon@vger.kernel.org>; Fri,  5 Dec 2025 22:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764972079; cv=none; b=Tnfry0aeYXjNEGNAIW9QyOoZyeSOEwib2s72oVFsM6nrpXxwO9uaDHIoQ55nj4NwJxfBlGPuU4Y1E2YmsxnWCR9VNWXdd6120KJXvbapSwnGi7dSGqCWx7bZo1/bXrwDeNSNwTdl2S40vI6DJDbv5rPkl64+6MmV0P+WPAAckbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764972079; c=relaxed/simple;
	bh=ETCxKe1lxZb3SWQ8fUOsUO737vubyIrWUWj25O2D/t4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G9drywsZwipVVUxe6IPWurtSlVeGRJPv5u7yueJ02P3Z7QEfj8749itZdBC03RZzqeiwGtIsnQyqKfcFAUG0aIssGtuL3uKRSx97MyzjzyGwmlJwFZl+czyMhD/48uBYTVTTfU7l7YS/6lUuqsdDttqOKf8pcJv2uoDO5I5XEsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UROvUfIn; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UROvUfIn"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-340ba29d518so1686110a91.3
        for <linux-hwmon@vger.kernel.org>; Fri, 05 Dec 2025 14:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764972077; x=1765576877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gxMNtySUxAzv/peSNoqoAdUNMoJGxwk+RXdpqiXVMbs=;
        b=UROvUfInTvuS00NH7IQ7TBwLYJNTH+AYTrtsKLVh2tuS2nByZD6N1L8tY9Bmj8e81K
         6DQaErku3kuO3Misp+fSGbTRorCccW3j9sIbkBetEdHZb81C+Q784aB6EQytxejouIWi
         HYgJUI62g1zxMlAwAy6RYYscSTbVUopkUlZYbiALMBUkbYSp0HBeS9I16u4iF/ywHZI5
         fFnpsjh0pgHIrujBOmTLHvj+mh8geuKx074QMOORyE3tA37YPjDh9+1yuMZwh1YTjWXx
         CbREveIk5ZnNL31+VRseOEeAlSsVPhe9C3D939b6rKXX53GL5BUO1lF+JAKGZo1cdcot
         tqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764972077; x=1765576877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gxMNtySUxAzv/peSNoqoAdUNMoJGxwk+RXdpqiXVMbs=;
        b=rj7K/tOEN5OQwahQG7N3O/pGcSEl+sKVLklfZWk0KPsWkQThTi2FeRKtOhSO917MKE
         d6G3vcskLLyQgoweLyf/A58R/rGo5/vKPW9dYIYEct2vnzZBrmnNjU6Xamq/KwYGJbb4
         k8jG6P3N7somDnSKjWYGEz/NyzwUMZwENZGKWH9G9t4ME7o5gHX7/W1ZXubVhng6u90q
         Gc9eHO53eqL3OcdiFVEPvrYK7NQ9MCn88fKiRzlXZRVWUfMoaDPCgEed4yytjExRYSm+
         Hpxwl9lJ3DfZsvo72tX77gLeajMNsL2vRFcme83dSNdbBVpcMj6yQJbxEB3eSZ02/r+m
         CgXg==
X-Gm-Message-State: AOJu0Yy2I0/vWnoiqxYfD+JSGBu4xfv2gMhh1sYXS/37gVKJSorx9I19
	wD4rr1Gz7uOaXXLbSscTBxNckJSmX0MBrJNeocUvqaa2DU7zIJDBbMoU
X-Gm-Gg: ASbGncszi6ryZ7CCU0jtXRlaFYigyooCaUv4+XGQAV9sRs+ph1FBNuK5RstzMQIIdjt
	5CDIWQU9LPcDmRGqgX1fNbDwWy8X+EV0mxr1KM7nHNvyuPOROAG6PgbmTHufWdlLxOjIMhZkkwV
	o7wM9jKWkLR65twZkXBfv1TGBvmjBolKqZy4fiAgHz0xCxV8A2VH4CVJKFBWP6ZDER6ppSjGC64
	KrBIBqtqYLKxVIiFB/72FdDQI84YpTSGJ7+elXVHM6QWRZEZDsayh3fnhnbcA32oiT8iYdzsuKy
	VN3QgAI7dPGrsmOpdW1tJiP8e72ocDZrkhufIjp1A5vXUPBV1PmDOYFmXPYgb3RgyQRluCylWqI
	Bn28QH6kuouFQ2ouFuf3+bKTIqX09CZYiaiFzYOVRx9APiua2IODGVAIZDixs1Rf8BWIyYUfAmY
	qhL93Ztu2K0Ed7YxKPKyJctDnmRfIsZdtYbWNDG9E8Bw==
X-Google-Smtp-Source: AGHT+IGuOUvLgEAYpZGh7Yc9kXE5Hzc4SXMEcfBaOSNY5QhZCDw3zlp+SMdkrWi0ruau8RBeB/xrKg==
X-Received: by 2002:a17:90b:5388:b0:340:d578:f298 with SMTP id 98e67ed59e1d1-349a25c2e2emr417620a91.8.1764972077160;
        Fri, 05 Dec 2025 14:01:17 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:8839:f626:f539:b6d1:1913:1426])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34912d175bdsm3851020a91.11.2025.12.05.14.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 14:01:16 -0800 (PST)
Received: (nullmailer pid 783287 invoked by uid 1000);
	Fri, 05 Dec 2025 21:58:37 -0000
From: Kathara Sasikumar <katharasasikumar007@gmail.com>
To: linux@roeck-us.net, corbet@lwn.net
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, shuah@kernel.org, skhan@linuxfoundation.org, david.hunter.linux@gmail.com, katharasasikumar007@gmail.com
Subject: [PATCH] docs: hwmon: fix link to g762 devicetree binding
Date: Fri,  5 Dec 2025 21:58:35 +0000
Message-ID: <20251205215835.783273-1-katharasasikumar007@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The devicetree binding for g762 was converted to YAML to match vendor
prefix conventions. Update the reference accordingly.

Signed-off-by: Kathara Sasikumar <katharasasikumar007@gmail.com>
---
 Documentation/hwmon/g762.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/g762.rst b/Documentation/hwmon/g762.rst
index 0371b3365c48..f224552a2d3c 100644
--- a/Documentation/hwmon/g762.rst
+++ b/Documentation/hwmon/g762.rst
@@ -17,7 +17,7 @@ done via a userland daemon like fancontrol.
 Note that those entries do not provide ways to setup the specific
 hardware characteristics of the system (reference clock, pulses per
 fan revolution, ...); Those can be modified via devicetree bindings
-documented in Documentation/devicetree/bindings/hwmon/g762.txt or
+documented in Documentation/devicetree/bindings/hwmon/gmt,g762.yaml or
 using a specific platform_data structure in board initialization
 file (see include/linux/platform_data/g762.h).
 
-- 
2.51.0

