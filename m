Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793833414;
	b=Bo1GkfnuX9Lzcyyt4LRW/TqTTtUoA/J5sBH8QXBNfRSszBuayY1axnnwf0vIKulK7o2v
	 20dGwkHNOjJAdqqHknAkns+F5fZHfFgEJLt+WUYaZ5+B2OVEbOyij2pBHOa/dJWiRtOPu
	 6Ly1vo5el9inAP9k3oFo89YgEUSxzB87cs70jESogVsGG6/iBF4Hg8Qw020rkuM8GLIqu
	 K+Y0YHbIZ/PwpjFnPWAaKcwsMia40vwbunmpN4JInF5LWQk+LcCjvh1AX5IJFJmBdJBKJ
	 XXxNXoMzGomerTz+hkvhanhs0MaCnkNwg1o1TFCCCLmzIhTfuIBk0u1+F7Zbj3JkIVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:MIME-Version:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=E3/qpbZQVNV3lMpL8sax6liyRC8rCnhmkYMiRpukkUM=;
	b=lB7ATOcRKF3qW8ktvFRShuKEkM6A1Q2qw5bmEcioHH162eN143FOsHNodZZnzmkkUhas
	 1oXx/tAqjalo77YIBOZgoplNuFpumtpN1Uf2qp9u5Xz+u2JUXiWtOL9yEphYvRt5CnNs/
	 AqOZuAsPdJzSiNATcomVtKvNDK9dz6mrdmYlHx6hFZoCDloEbaDLMaLOdlCif8vu+W6hX
	 d8/a9V1f0VR/BrlSrOIu9OQhPzClGVKY0FIEv3xmM5L7AzYtoOL2eBzQEiCA9Yh+TMBlc
	 xF0SpkljOk6N64NBSHqHyGw2WMeI8P/HMDlStv2oGKT+rrRIWlpezWm9kU1aRmAa7Ug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wu4+VLWG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0D1606EE97
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Nov 2026 23:03:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F0D1606EE97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wu4+VLWG
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4a76f63b243so84610fac.0
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Nov 2026 15:03:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793833413; cv=none;
        d=google.com; s=arc-20260327;
        b=WB4fBCn44PU9MeAvON3a7s0ITmJjehgbaGVtreUOm0b6PVS//6Z7CFvShvr8hBLcXu
         A5s/htTBGnkw/VbEmRE+EKdl9QswcypSpxtA9VuGOzhhbokcetlpNW62chiIwb0UAOZq
         SKTtTorDAGMrQYuqD4fMI6viGyaw1S6ZGRWbhC7vqCYUGgeTPTjJcbHgdlrPWoWonvT9
         pzbjikX/bWte3AGjVJrySQ1z+lLgv1NmW4QLIXidC7jMKOLq0mJ/fJCDRCHUMrWdVMow
         ErjPcv2rMi5KBzotjYqln8l5K2zv5i0LpaepOuaW6Nf8l1oWkdGm/g4MAZD2a/25ZnmG
         hdeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=E3/qpbZQVNV3lMpL8sax6liyRC8rCnhmkYMiRpukkUM=;
        fh=GNwwPjUiN4n9G3Jn+HqDW8Vpr69vCV8GpXZl0N0Q/pI=;
        b=e5RpItK4lI2723+287+VfI0Pwk4nODqtnDILkE4wnCC+269UzUaKQOhGOEdPjVgytw
         vM3dsIIw81RxSfbLyTiRNu1gm5lKrJ5NhLWpTo7iXvdQM3wDAmzGSNPbvOCYA5l35k/u
         QZArEMyP89/e0txYEQxs7VtuonAEbJza/HOS2a/6ev/i2GZknD3ntOvvUC2/9JzpryW4
         pnh8TwfGsPw9PrOjNC8ru1C+rbH9maxWF7shhERBqKCb1IhBO3tvFzebDRpBu3JFfVYk
         bIie3WQinOpzedfqJlHoqPv7jjbyTTf8d3kbj3LOjhmwtpiw5qlgQrmivQpL+Fpk6g8z
         l7kQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793833413; x=1794438213; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E3/qpbZQVNV3lMpL8sax6liyRC8rCnhmkYMiRpukkUM=;
        b=Wu4+VLWGmMjjBoxRHJtRMJhfwRcobe8fdS8Amtqz9PKv/C+h/sWuWwSi61WZeR/N1o
         0rLNvMQpZDoBcjl6hckr5Xks0iLQ51BnGOfVwmLlRz7xZEDIwgFtK8ktILHfgzTkZk8o
         tbdYdFQdelddvOjrEUnSRtU+SsFkDsIpTf3hSYCH4vqRp/0LgMIO1kP+GGG9TV2sgsr/
         V0ewFvLUbPDIlNrGitUpkwTMuFzisoEPauD7ODjrQ1TFBysqkgdYUx2ybwMlFl6GOKug
         8cvaRBaqp64VsYQMSc0GXj3rQhpTk8jeTpBKrAJYPyfjoUNhvPydnznmdjYFv8aGBTDP
         8PAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793833413; x=1794438213;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E3/qpbZQVNV3lMpL8sax6liyRC8rCnhmkYMiRpukkUM=;
        b=zp8KaVqdPXDwYqeIjAqJb+GY0uhQ6ofo/sMmXKofIeIZh/zBTxtph/zIx/wh0KJYJW
         UsZyWT4EgM0lH7HK6eI9kExyhXqAMk2BSvZAbH2+Ni4qHjAkrp+ZvA4PXFRzxq/PCyy6
         fj0nFLnVIwkEuMQPZIBqXhUrgu68c7oFJXf4GHy/+9MxrZ8rq491xa5QzssgzTE4TiUU
         T3eqFwBknMRcdRKTMBQvj+TQdOQd+ZbeT/9CjJAU25DPKZXhFu8ZNTAsk+6Hm6JQcaHO
         vBT6R5FnIg35n6PiR2WDWzRSmdEgoMsaE7D0bqfNeD1bylFXgqS5zM+KEmChoaeI/8Gy
         3UQA==
X-Forwarded-Encrypted: i=1; AKwUvBysIk5X/3x0KPBI1JmB9E9BAnJeHyPjHo1br0rcEUwf9lguDCyNrCFW+CsZz/Q5Uev79eoiS5yBh3Dycg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/oRufth4oopgYfFarAknN51unF0deJXkJHvY9PcfK4X5iyCVU+
	sejBs3Fgj3AxAhhQad1uQ6SBvJgIyjsnKE+cwWoN3FvbnPX7Es6vkhkcR0Zh3I3VX0f2/MugZ6U
	wi4cR8nO7XZjxGzyd8XXanVVJxLhvn1k=
X-Gm-Gg: AYBFou19/G/7YhpI9Nh+ExakuCP3EsMLB1q/200Tfjzxn/r280FvXRN9SwUTrhK4faI
	106lHZ8SIcJGD+txTE7tvVz2S3hJbds/l6XxwEKu6eqo8btI90lO0JdEQbmyf+2q+7ooXl6nvYU
	VXlBnK0tvRt5e1Ct3sJ9p4q960YzNxPHdSe93bvbV66fh9ac22MjzFHTr1/1UNNmrzoqSFoIE3Q
	sKC9V2RSwPyqCFRE25kc3Ml8Pd4xN5zCLzg4YI6sOJfyJTfLi5B8canmgBA2ole0ODCFf1nDUWp
	+5EPr//do/H9UBJUUgLTtxm0AaKkR7mNs2jkGat2xZ/kCdRtjvyDAWOBH4tNSVJPv3H/5O2KDN0
	oq4REho5LwbkyT2TD7YKWTfS004MIW5Q/pfL0PqDEFTVU2el9GU2ZMWyHjA/hbKT+5EO5ius=
X-Received: by 2002:a05:6808:1513:b0:53c:4502:971d with SMTP id
 5614622812f47-567be6c8a4dmr544823b6e.36.1793833412958; Wed, 04 Nov 2026
 15:03:32 -0800 (PST)
Received: from 41474967715 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 4 Nov 2026 18:03:32 -0500
Received: from 41474967715 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 4 Nov 2026 18:03:32 -0500
From: Kirtikumar Anandrao Ramchandani <kirtiar15502@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 4 Nov 2026 18:03:32 -0500
X-Gm-Features: AclHuK-E5HhSsymovm6gqqi0LHwYAX2YAQzu1NYpLgCPDxd0d2GuBDjgyNjYCSk
Message-ID: <CADZg-m3Mnk_QJ44HrH4SkCm+pN5QteeQv8zY9Q7EE7RQv65O8A@mail.gmail.com>
Subject: [PATCH 1/2] devres: add managed timer shutdown helper
To: Hans de Goede <hansg@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Provide a devres action for initialized timers. The action calls
timer_shutdown_sync(), draining the callback and rejecting later rearming
before device-managed storage is released.

Use devm_add_action_or_reset() so a failed action registration shuts the
timer down immediately.

Signed-off-by: Kirtikumar Anandrao Ramchandani <kirtiar15502@gmail.com>
---
 include/linux/devm-helpers.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/linux/devm-helpers.h b/include/linux/devm-helpers.h
index 708ca9131..ffe8b68b7 100644
--- a/include/linux/devm-helpers.h
+++ b/include/linux/devm-helpers.h
@@ -24,8 +24,33 @@
  */

 #include <linux/device.h>
+#include <linux/timer.h>
 #include <linux/workqueue.h>

+static inline void devm_timer_shutdown(void *res)
+{
+	timer_shutdown_sync(res);
+}
+
+/**
+ * devm_timer_autoshutdown - Shut down an initialized timer on resource release
+ * @dev: Device whose lifetime the timer is bound to
+ * @timer: Initialized timer to shut down
+ *
+ * Register a timer_shutdown_sync() action. Register this action before
+ * arming the timer, and after resources that its callback may access.
+ * The timer is shut down immediately if action registration fails.
+ *
+ * The callback's resources must remain live until shutdown completes. Any
+ * independent user of the timer must stop before the timer's storage is
+ * released. Devres actions run in reverse registration order.
+ */
+static inline int devm_timer_autoshutdown(struct device *dev,
+					  struct timer_list *timer)
+{
+	return devm_add_action_or_reset(dev, devm_timer_shutdown, timer);
+}
+
 static inline void devm_delayed_work_drop(void *res)
 {
 	cancel_delayed_work_sync(res);
