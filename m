Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3796F282F12
	for <linux-hwmon@vger.kernel.org>; Sun, 17 May 2026 01:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778980707; cv=none; b=knPBQ6I4luMTleUswWOKEFxwV9WRo+PM9P6yG99VAppHVye1uStDCjypAMPNQ6Wt04dVe22YszozPk9tJAIoTJUfivhyXtw9EhwMp/3ayUhU6ZtB8qOzZCe5ii8fTQha08PklNmaewegzUHY0744JLGY2Lr1PSEg1jnRy8oVKa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778980707; c=relaxed/simple;
	bh=1oaVCYFu+Z3wn0PGr8YB2H02b7P7H8B/ZEdQDxK0+R8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pJOR+b4oS99mrJn/59sprUXXMRDe0bGbjerpGxvPjDsUE/TjNTsZ8kYEAmv6hRJrx5NpBaSGMQ6etuXc2210sxQEID08B7jIR6sv+Z+1/FAuMK2q04cdw17jLmN73NlmrpGl8v9N/Xi6+oiXGl6ecqixmnSCN0Tg3nr2gU8+y8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=TcCiQumS; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="TcCiQumS"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so5126896eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 18:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778980705; x=1779585505; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IYSwPCVBiY867WtlOZHd6+dxA6JQuid7JW7mJwnbMfw=;
        b=TcCiQumS3JMRRQgYEl1wrq40MN8Mn/59wxYrvpKT23k3L8VjEZwEK0xFbB33BXhTHi
         O0AQPPoXg7//BN//7gMlXCtB4khoVY2U9zccNFhlFyU/zM0h0UUcKzub85EGF014sOpX
         ZXzlwsbIlfaW7NnMFg+lIIQpoXopYI2/UJaSS81WpBN5BmZ+nPRx5bdXhm06o4ar1FVw
         lpCnLG0lQbgAA5BIwQg2ZbDjO/J2uAaDZbqbLtbiaY/CB8bE+saqSozVf75uNqpqVbY4
         KNpFaIFrZER7QxIlmijRq/jQ0GoSyc2M0+TSQ0FugFu+PktMjcTS2vrudRl6YbZpfQzr
         Qjmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778980705; x=1779585505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IYSwPCVBiY867WtlOZHd6+dxA6JQuid7JW7mJwnbMfw=;
        b=MxidELc7le6XyIMJeDUqLFE1ROj+CPq+lwmK+etiEvxdIJRgDdjALm/YzMTz56Ne1o
         nPyOo/1u5wPugCiuaf2C5lYvP165Rfq4NzS9w39KL44IcJ8wNETOeaS762QyUcAzgNK/
         Mb1+BL9b5ynHuq7LymII4nwQKEVSVGKoYzWsNnWq2BUIoIS4Mv7Mfm3xhokN07G8f62x
         QI8ymoeXoRZz2YmLZypNz6w0QtjRn6Bb1bGF6KHQOFRs46RkCRW/h2GZU2T34c+d3qDQ
         syODy87FcIGB07DGJ3bsWR9IQgz3QtoUg6XuuAIhWfc4CEr9O0bhxycy2JVYIulfBZNM
         Pvcw==
X-Gm-Message-State: AOJu0YxDJtcVZZum+cd9KthxiGl6I6Fj6WgIyKxXew59YI7gowpgbpGG
	7cNIPIDU5su0bnEFb+3kAVjylgducP4qoQfON+urGflGZp4gGfRgIxCJ/uG4YEMNfWg=
X-Gm-Gg: Acq92OHHezh5hIKF+snUYyeOOp3+uE5zrK7o3/BupCLvGoo+j8I+WXBae/H8aicfvPO
	C41wLz61dARgSjIc6pTzD81fxbMNfluu/hhXyK3KtwIHQK+Z+oCR4KXbKpRoiEwI8gDXls2++QA
	7iBoxZIvkOXfJSGQQbXlGPK1lUAsi4ijqD38WmR/+Og4B4JFCtDpM6dWDm0LVzw99cbvAeXfxQz
	rmUBKUvqG0jWdnDhAm9zGb84RptFT05Q0bh/WmrUtJOS9xy370MmICFLOLJiwXicu+VUfwimjht
	MoAFmT48mtNEnyMU6MdaYm7vvTzCMIKRMIypNhVW2Y5dNFBG75zrIZxxT08PoG5tKHAoyh4OzXC
	9Q/ru0HVgo+N8mpc2aCD9hxF8Gkgfgblhhc3+VnqP0k57rFcE3uDYJ12RXpoCNbotR3ESnjYJLe
	UZHLz+LsPirA8gziryPFiNCsWSGg==
X-Received: by 2002:a05:7300:e430:b0:2f1:3aa8:f2c with SMTP id 5a478bee46e88-303981914bdmr4574268eec.4.1778980705368;
        Sat, 16 May 2026 18:18:25 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302973bbd50sm10582179eec.20.2026.05.16.18.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 18:18:24 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Sat, 16 May 2026 18:18:21 -0700
Subject: [PATCH v4 3/3] hwmon: (pmbus/adm1266) serialize sequencer_state
 debugfs read with pmbus_lock
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-adm1266-v4-3-1f8df4797258@nexthop.ai>
References: <20260516-adm1266-v4-0-1f8df4797258@nexthop.ai>
In-Reply-To: <20260516-adm1266-v4-0-1f8df4797258@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778980702; l=1541;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=1oaVCYFu+Z3wn0PGr8YB2H02b7P7H8B/ZEdQDxK0+R8=;
 b=gw9OQFjQpIlwlV53+0l9EP5duOSRP6WpWgKJG5fonuIRM7fKGg7xEStTvs8VETKX9jmMk7tma
 /HbqVdVvgKqBdKEdbdmRGcXFTZWv+OJpKNiHYf/5ysVroM3jYn7OGr6
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

adm1266_state_read() backs the sequencer_state debugfs entry and
issues an i2c_smbus_read_word_data(client, ADM1266_READ_STATE)
against the device without taking pmbus_lock.  The pmbus_core
framework holds pmbus_lock around its own multi-transaction
sequences (notably the "set PAGE, then read paged register" pattern
used by hwmon attributes), so an unlocked debugfs reader can land
between a PAGE write and the subsequent paged read in another
thread.  READ_STATE itself is not paged, so it cannot corrupt the
PAGE register in flight, but the same defensive serialisation that
applies to the GPIO accessors applies here: any direct device
access from outside pmbus_core should be ordered with respect to
pmbus_core's own.

Take pmbus_lock at the top of adm1266_state_read() via the
scope-based guard().

Fixes: ed1ff457e187 ("hwmon: (pmbus/adm1266) add debugfs for states")
Cc: stable@vger.kernel.org
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/adm1266.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 2edf3a424679..1425371bf1be 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -323,6 +323,7 @@ static int adm1266_state_read(struct seq_file *s, void *pdata)
 	struct i2c_client *client = to_i2c_client(dev);
 	int ret;
 
+	guard(pmbus_lock)(client);
 	ret = i2c_smbus_read_word_data(client, ADM1266_READ_STATE);
 	if (ret < 0)
 		return ret;

-- 
2.53.0

