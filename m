Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8C123C8C7
	for <linux-hwmon@vger.kernel.org>; Tue, 19 May 2026 00:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779151959; cv=none; b=basEz/dd5ddRusOIinHxppvneYPtivjytDEqk4Pez7ghbgCxMk04MZzKmoBnud1nartmKVnYwqCRfTo6NcqmKDk7pnMMYt3teLvw4VO9joJNyaq85z47NAGjzwyrRMnZFJK5csUVq2NdwyI7qEhmGjjiqOVS9mP45WgBW80vcEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779151959; c=relaxed/simple;
	bh=FDObNUWMvwjjzrN2IkV6Cgo3wEKZLI2a8RqN+knZ8DY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JXcAqp5iyMSgCV4VV3/HSMQI0pf+IEgY6JW9M4o+oROtC2I8kE/sPUOVTXHQgia6IhyP5MYmOvvPOH0fqB7o7hZLBZBvqyq7qqMdKldD0zqjHOqz6YxCcllrG/OkbC/x2QlkyNl1GCUbR43KXVPsKLUUQKorvSlnPCcNbBdq5WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=FokCYGVf; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="FokCYGVf"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12db2e415a7so1362766c88.1
        for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 17:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1779151956; x=1779756756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k/5ooRxhmqvebnRUuOuBr2iP+EihWYORWSHfWOHXOBo=;
        b=FokCYGVfbUh3NyYoQHX98CPim+tFdcPD3ttErufWDJtZIqPQbdnPeRsCt/cv+gInSR
         BAdSdvFMUROPobIGUgaWJUaodkTLlj0Lizu3cM0FW1Pq8CzEj6O8W7liMNbEpVBbXxeG
         v6vRGyj+YiNdB/sJYyCCbA/9da4qzUi5uTnFINwKDTPQA8qUOk8oqfbYwyk7cIF1eW0s
         u+Sgofk85lc1fhVYTPG9ZKi4wwkehkoyx1YCKxf+ZvcodoAO3O2wzaKPMSfgxK2UhEj3
         b+ny1xDjhaEVM0qBav3u1kA3jdlJFQlgpvwYTL3YWOTIeMHW1k+PJFbjvMmTTn91b+eS
         ev3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779151956; x=1779756756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k/5ooRxhmqvebnRUuOuBr2iP+EihWYORWSHfWOHXOBo=;
        b=ik/A7w1A5m2IJEgVowF15IT3X4vXqRnE6ojhwqJHcihQQsPLY+zzCtN15xYwGvOLGb
         dt/DQdbTWEiaz/Jg5rXnhYQ1AIKI+2MPQKoQgZkSLbSLMADThADoqwq9FkWR8ar/nzZg
         2WjkHtQ7PisHGvUSExqitnxVJVtniZNdELd4BmTosLetrMlFatEOAURz3G8CZLvW6EXD
         sJWLa7QeO4CiWIjWf7lzo8HyGldeMyX03winBM4/BHj79Six0d8cEtW3qgqOPoc25i6j
         FJBdy/i5wcbcNpCC0jn1ijXdytgBUFkqrRTBG6uTImxNoBI0JnuZCP93RTQvEjxL96bp
         YCxw==
X-Gm-Message-State: AOJu0YzKDfA7sMACAUAJq9kAhx150J8WJoVTJ3rIbCb20uMJ+4L6e/LP
	YnNqWkSLJDYjComlq8LEbm/sdq90nDy/4u9pscpSK4ap1oegRJuxdcKCq1Ln9boX2fE=
X-Gm-Gg: Acq92OHMR3roP6BSCWhosWFyTqVknwegXIgtAdZI9P/agkCGxCtMjoQ1Bf5l+eoCD/k
	dZQ44RJ1Gc/BHi5y9am+opZ+ydtUzC7xFCal5WxZsRdQtw6FQYL8FosbUY4zBsl8VV1X3J2WoZj
	WMZsia7o7vg7zM0z2b1bhYUrSGQhK08ju6+szxLTE9BD12IAsLlZJsxF6nLNdCDJLTY5WdVVFJm
	06Igbv3k1tD2UIMvL0HZsPWoZXtoOgEsKzJkUkmiN6XwzZqlaHrAr+Ah/60LqNOh/r1jEDWsX+/
	TaLjvJ+5tLblhxRcOGqSPV03I+havbKRXCII16r7zM/HM5/T7KO/2vsqfFOICPveyqMwVrv6Ptw
	ILHkNyGro4Ukf8yGynDAkqN9bXCJf8AsLm0MKwhA2fOKWSTzk+DL1xwWZCIc3ROXRV9kCQhLLyK
	yKdgsRBJsxS1CxWVPPEqtgfF5yAA==
X-Received: by 2002:a05:7022:f88:b0:12c:2dd7:9099 with SMTP id a92af1059eb24-13504945cc6mr6484019c88.30.1779151956046;
        Mon, 18 May 2026 17:52:36 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb93f3sm22546633c88.3.2026.05.18.17.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 17:52:35 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 18 May 2026 17:52:31 -0700
Subject: [PATCH v3 7/8] hwmon: (pmbus/adm1266) serialize NVMEM blackbox
 read with pmbus_lock
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-adm1266-gpio-fixes-v3-7-e425e4f88139@nexthop.ai>
References: <20260518-adm1266-gpio-fixes-v3-0-e425e4f88139@nexthop.ai>
In-Reply-To: <20260518-adm1266-gpio-fixes-v3-0-e425e4f88139@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779151949; l=2029;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=FDObNUWMvwjjzrN2IkV6Cgo3wEKZLI2a8RqN+knZ8DY=;
 b=o4T0vpm7vwd7nU4PKFq3LRjfSe8OC/WKKKQElG1ohtEyZMkibITfRtuoo4iMw2HUrWZ5T/jQj
 fdKq75w5UTrA8wEIqtvyvFpSdRLwy/IkjcE+xsu56FiOHl5FTYfOXj8
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

adm1266_nvmem_read() is the reg_read callback the NVMEM core invokes
when userspace reads /sys/bus/nvmem/devices/.../nvmem on this chip.
On the first byte of every read it does a memset of data->dev_mem,
walks the device blackbox through adm1266_nvmem_read_blackbox()
(which issues a chain of PMBus block transactions), and then memcpys
the refreshed buffer out to userspace.  None of that runs under
pmbus_lock today.

Two consequences:

  - The PMBus traffic the refresh issues is not serialised against
    pmbus_core's own multi-step PAGE+register sequences.  A paged
    hwmon attribute read from another thread can land between a
    PAGE write and the paged read in either direction and corrupt
    one side's view of the device state machine.

  - The NVMEM core does not serialise concurrent reg_read calls, so
    two userspace readers racing at offset 0 can interleave the
    memset of data->dev_mem with another reader's
    adm1266_nvmem_read_blackbox() refill or memcpy out, returning
    torn data to userspace.

Take pmbus_lock at the top of adm1266_nvmem_read() via the
scope-based guard().  Patch 5 of this series moves
adm1266_config_nvmem() past pmbus_do_probe() so the lock is
guaranteed to be live before the callback is reachable from
userspace.

Fixes: 15609d189302 ("hwmon: (pmbus/adm1266) read blackbox")
Cc: stable@vger.kernel.org
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/adm1266.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index a80fb2ea73bd..051f4f188ec5 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -394,6 +394,8 @@ static int adm1266_nvmem_read(void *priv, unsigned int offset, void *val, size_t
 	if (offset + bytes > data->nvmem_config.size)
 		return -EINVAL;
 
+	guard(pmbus_lock)(data->client);
+
 	if (offset == 0) {
 		memset(data->dev_mem, 0, data->nvmem_config.size);
 

-- 
2.53.0

