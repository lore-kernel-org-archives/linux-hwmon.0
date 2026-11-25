Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616401;
	b=j+vi+EJuTpAWqOXOVIinh/maYGsS0lbn3OgcgzuvFnDHC8+O4TU3q4TVyQxeArTNzLKJ
	 Tp4t3+B6PVH13nEm+Bufo8LWexSSJFmg1N5+tqnvzGRnaxKDrtNCEA1KWOqSnzimtWq3J
	 SU5HNySAdzHg6zAH3MUV0KXagMs+XjoPerZr6hcuWX8KmkFTZggStbOeZvfW5Gu27/X6W
	 WBSSDgGpl604obLpmWwSGNGltGlk39rQSptGWLXQLC9xtY9GfKLlv14191YsM3I4IhjK5
	 LCv4X5JZ7qZBYSrNe2nspU+xTG3tz+Q/pe/XH/tMoLkAaBWJ+zgxzShx082NfY1FcHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=OXw3aEY7EdNjDs9Hr7OeVs9fvmVPov8tyqpiU1M9Iew=;
	b=Gqtf8M79bRMgKjxSzAMT6kqLYMFtXAbI3w2R4ATThrbHvVbozSb/48l1EufWTV0n/GLI
	 C4IJbvacggfOqlWAXjYir3YC7SqhwtkMyL8IbMsL8grWQooQBfopXqvjoJbJ1WBUGG39F
	 oZ8k6CWeZgfZylQ0bCXlSUK5K+Z/fPZOZY2URNj+wpxvLD6EBKzelQ7Jan7w8evEGoAx7
	 zy2gwVIe84xZfuUjvdCZO5CX24gMU9cnN3jqjO6z2bQk8Rr8GhCBMUrza6iErl7wbDJvj
	 Pk7sJ1e+E17s+NV4b5ef3cIX8TFDk4ugTg+smz/qZPCV4PXoHDgYXJc6jUHUMneEbMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Eg2zd9Gl;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31836606A32D
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Nov 2026 14:20:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31836606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Eg2zd9Gl
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c516a192844so539315966b.1
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Nov 2026 06:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795616399; x=1796221199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OXw3aEY7EdNjDs9Hr7OeVs9fvmVPov8tyqpiU1M9Iew=;
        b=Eg2zd9GlqLRBwDzyg/AOkaSPlGMQ+z8bkz6FeiX45oCMLFDuiEKc+1iCjq3aiw5kix
         sHM8aKNfvS1jKrcIomXL6e/ofWmvjHNXO6tcUkvGNyls+jBX5nhgrxdY5DN351ZudV8o
         EZ1qUgYf1qbYvAJ8PxRD8+DcsMipVnEvZWm+1UKa4X+YqN5KmIerIU1/oGfkm/BIUtOq
         FvlcZXt9RF3+4sKN7o5W8kpNd6a89gQoN5R1ggHcSH8iMMrndVREE2FJdI2AJGJ/+SIm
         EJEUn9irDIaln/kxrVmKIvt+BKskA0yPeLjogLUJ/aypZK+cwdxu5pH5ZCWhJldwRu5s
         W1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616399; x=1796221199;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OXw3aEY7EdNjDs9Hr7OeVs9fvmVPov8tyqpiU1M9Iew=;
        b=Unqd1Z1rHJkdu/j3durC8vYI0gtIVcl+QxT/iEmkk4XBtUn2+kJ9rgE42Nb3PSz2cU
         uYBZGSt5Jjrd1eOOExVA418RV1nabCHRbQQWIwZ5TBmPelELxqO4/7/Y3mfHug4/yTxg
         Tnxhk6HV7Olx54TKHx5gGUH8j7FJsSqisDMYDKC4RpmoVq4zxX4vk+bGF/Ot482etUwy
         COKTFQdBPJSwXiQCb43PTeoar8f8ODgU2G8TdZ6v040Zi4H1Hf5qWqu6jZmnPCIJKzCl
         74K1yZrSZlxO/VW3aDhF7lXSi8mxaVxEFEdpcG+6uLQ4MXGZoiUQrcfwVOhMIENl5P3I
         5eRg==
X-Forwarded-Encrypted: i=1; AL+hErFk4RbHlUZBXd7BaAhQvtrbdzHCT/VWsoEQzU3Jx8YsrlJGiBIyhQ5IFEdOo1SpdVOLT41ESY9SbkarKw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9OXcLYXTgqgHewqfJSBZZw1yAiLCf0J9XIAQhEGUeitWq6SNf+
	Bh3tc3SdT0PQb0jyoGdHdbi0poPGXdNVLMyn9DhJ/7I9DSeYwvCnUK7jHO/0UBzaVYY=
X-Gm-Gg: AZFdTZcLcskhwwYil6FIyHIByzHC8m1nv5tOGrxWFbHN21F+O6tXT0+dntPG6jOSwGO
	9XNolC3l+O2FSuJ34hkAX3gDARMER30PsEafnW4aOOUXBJdG7BeqJp/WEkxcXhzuKnpk6Gs/PPE
	8dhd/9G+cgB5O28JDn75CrfwN1HRvYzGZt4F9de3wsXdNF6qXkd0yB6rRH4Q8paq8sjggb0WUmh
	21D9ToNPXn8PwlKZYa6DUf+n7cLsiHRWkZDbHwcq+XSPtym9eE2NnCJi15a9vildMSmat1eS22q
	QmW65m011w2TlqUTaCipW+jTrFMrRoSiiB+c/5sqnQ/F5K8TagVL7SU4mNtWfri2TZYvUMq3Vgl
	XMzXjGDA5jYWsKFEFhI+xqHFgmQYOGmHxQrUqvUZvPlgCIaKu+u8UmNalv3hEjoElCQa8FZjmNS
	u3VpKGHk5qlgRnuYOkCWbCzZhTPT4xZz+hXiAbSxO4uxfqZVsD2eYjKD6mECIRcYSOZEPCXeqXW
	Xihu5cp/kg/gF22UuwWGCQQlLJtPCyXyg/W38hbrOEtbTzn2ya8pkye5cG/HrcwMHTWLisOv2Js
	0V0sVmbfBq8G6rEgNoWJdcOZt+lcWANTepU=
X-Received: by 2002:a17:907:da0c:b0:c50:5545:b66f with SMTP id a640c23a62f3a-c513a803353mr1371674066b.23.1795616399382;
        Wed, 25 Nov 2026 06:19:59 -0800 (PST)
Received: from CachyOS ([176.88.126.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51a161e387sm123379666b.47.2026.11.25.06.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:19:59 -0800 (PST)
From: =?UTF-8?q?Asaf=20Nuri=20Bertizlio=C4=9Flu?= <asafbertizlioglu@gmail.com>
To: jgross@suse.com
Cc: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	x86@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	linux@roeck-us.net
Subject: Re: [PATCH] drivers/hwmon: Remove wrong comment
Date: Wed, 25 Nov 2026 17:19:10 +0300
Message-ID: <20261125141912.120978-1-asafbertizlioglu@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125121643.25427-1-jgross@suse.com>
References: <20261125121643.25427-1-jgross@suse.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Nov 25, 2026 at 01:16:43PM +0100, Juergen Gross wrote:
> In drivers/hwmon/coretemp.c drop mentioning rdmsr/wrmsr in a comment,
> as it was incorrect in this regard.
> 
> Suggested-by: Asaf Nuri Bertizlioglu <asafbertizlioglu@gmail.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Asaf Nuri Bertizlioğlu <asafbertizlioglu@gmail.com>

Thanks,
Asaf
