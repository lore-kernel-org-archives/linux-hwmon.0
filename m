Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795345189;
	b=JVPiadbF88deS2PLgGUcfw8Ew1Pr4adLQ+qnSDoIc02hTTEiYz3kD41zoWpS2R0vSUcN
	 xfHLpkC5qHXmfgsEEKAkglIfUYlMRfW7ZKVFMnV9JxEZeswbHQn6EXwpBWJMbEwZKeR8u
	 HtHPUvsRLx7fWi+XvZxMO6+p8T61HgV1vN4N7b/t6YS10/P08VZC7n6/rkCDhCkVUcfP2
	 +7KBaWHik2uZHNVqtcOcZ1r+hcY7nOPPR2SdqTR9BEx3cEGtuoSJ1g7isEaatyi2CNUAL
	 Bp4O0wNgIOnBvCE+mVP6qmgjJps+LNckmIeSI7K+DHJOUo1vw9h95HC1wLSBgdpPncg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795345189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TZAQFu3q7yIjuPZZZm/af8wwwRsKvLwu4IpEfG2N50Q=;
	b=HJC81gG9KWBHcGrS68y24Fe8j1XLTmqi7FlldemivBWTtJytNW8e3V84t0FgsTGcWC6K
	 t2XL0Oba4svkLdPGZoR4hQUx/7FGlLGUxxP1FrZP8uSnvY5VE10kzpfY65DN0OARqBky+
	 jFHhQkrr++EzxDAIog9NNHhndl+iaUcNuMqMW5WJEWdjtpM1FG+nWKr3Y/AfTqli7yjqZ
	 rlFk7MhUcCpaabFkUyCIPG2pu4OJLfF1V3YlxQ55b8A7vV8VZe6l7NxJv8nZv9MVmdr0D
	 kq40W3gx09X6R0AMQMAzUDD/1549dBVRELq/lqBHGD9k99u6z0nPHKfEhl1PhwcjpOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h7yw09+t;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0266D606A320
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Nov 2026 10:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0266D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h7yw09+t
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso16109785e9.1
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Nov 2026 02:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795345187; x=1795949987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TZAQFu3q7yIjuPZZZm/af8wwwRsKvLwu4IpEfG2N50Q=;
        b=h7yw09+t2VsOdwupDDgRi1cIWrMTuI3xPDWn3nXdrcUPtb025VTEIFBv1A8GHFcMiT
         q1pFhyCvMpEzxNY7ISMEzv5AnNI9IhiB1RbyK9RzZwSC/EvPy6NEkp8lI47645dHrIAC
         V2VTFiQsONVUJDJGY35UsMtwA16pkjio0AvFwFUqnzZvO7XqVmKJ+KEjV1+Y0a5akw/v
         /YVppLIoHZpbUBScXKKkx9JifYx7CYB95yM8iBHm3fuGQt32U8kaAwoZwUjL7CWrksPU
         H1Els2S6HuuxGt/IHNs+v905bZZL28WOxkyY/vRLu+wZN9MnyoSbT3OKjG4tbNzS2dt6
         VDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795345187; x=1795949987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TZAQFu3q7yIjuPZZZm/af8wwwRsKvLwu4IpEfG2N50Q=;
        b=PuWOfzv1MEcYaPNuNZnLAXfzaaG2ZUnplnACi/GuLqQRphey44r4Fb8eoMaWtsfJwz
         Wq22v4YcNiQ9S24dHuBgbLVgEXlHV757J0EIuXd0b04npdI73OdjR09BX5Q/5SatwpXh
         n7a7tW6HbdFoqscVtcjuYBB8u8++juuirrHVFhMj9lqap1BMxSTqgM1yAV5x4PK/DPUv
         vCO13zVmp3MBDiQAmLuGk7hVBcsfdUPt+1zWl/AvMGX+gYrgMqrUKWR3U4t8Xv3J2/w/
         0piddyCto0crKz3Wxhgni/SgFRKNecMeCSPwXOtnTOt586Akokcq7ysdG0OjeTq1USP+
         4wSw==
X-Gm-Message-State: APuU4Z8wH9fhsUkDWJsvjODb1UXZm9P59u/nn4yMwMaJnwmIIXecblBj
	k8FVOBues8+Hno0DfxOFwqDI/qHNxytvBMedaSszaMwz8c/MgF7YPc9W
X-Gm-Gg: AZFdTZdG8/1gTpNmkdOy6WnvVByWRPuFsiTHOCFFWwbbjxDYdHKjV1gaX+j+ZvzqYp0
	oeQeXbScnAtYbVmg9ecE9g+lJ762eJ/v72u2Ff2yZa3IeruIMwaNp0cMeQypiizVQgq8BHGN/TU
	IiOocHLBM8N+6nM84sECkfngZsBLj0GrtO+prrfTOcJc0RMkvrAiVPV+khY6MGt/V8sEGCa2HBw
	3ouJ/zgOorpBLUgDTMYVp3+nSDnTEHSFlrpatEes3HAyqrHgDAAGTXY3krF5knKnlb/YfVHxycj
	X7arbXO0rBg8R/UrqCtKC4ph93MijhGBujSix4aqlUqz1MZHNr+utMMGPMFEH+7VqA6aXLxCz4K
	QU8JQV79O1roBdsq7ZEHtHJNgcfc2crEEAfFgnSAaCQyNbSQevpsivq14HZ1okFEBZOLhX0IYkI
	/jkcA0IWHv3KkRj8LnPP9zm2vpofIh/VpIpGFTHNR2dFtHWTuISEPVodhPlJaHs4aNuzIBh+9HH
	AFuMFvl5PgeEjILWH6/7YV+6KGWFw4+15Xv4QWVrLL8WMZeq4m8DsY+t45rfiKatDHnbs+ZpyYU
	gfO8w8M60IR4tEEyhXr8uHgtwaqINwmPn5yXseI0D6JbLrNpij5xljsb38FnvJYwL4fI
X-Received: by 2002:a05:600c:3113:b0:4bb:693e:4c8e with SMTP id 5b1f17b1804b1-4bb88816a53mr190665835e9.21.1795345187058;
        Sun, 22 Nov 2026 02:59:47 -0800 (PST)
Received: from fedora (cable-178-148-254-107.dynamic.sbb.rs. [178.148.254.107])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm261990675e9.5.2026.11.22.02.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 02:59:45 -0800 (PST)
From: Aleksa Savic <savicaleksa83@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	spoon3r73@googlemail.com
Subject: Re: [PATCH] hwmon: (aquacomputer_d5next) Fix collection check for Aquaero devices
Date: Sun, 22 Nov 2026 11:57:00 +0100
Message-ID: <20261122105700.108378-1-savicaleksa83@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122012528.881538-1-linux@roeck-us.net>
References: <20261122012528.881538-1-linux@roeck-us.net>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested-by: Aleksa Savic <savicaleksa83@gmail.com> # Aquaero 6
Reviewed-by: Aleksa Savic <savicaleksa83@gmail.com>

Thanks,
Aleksa
