Return-Path: <SRS0=CB9w=4H=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C06FCC5ACC4
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 Feb 2020 23:03:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 81077206F4
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 Feb 2020 23:03:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NnGt5R48"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727429AbgBSXDm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 19 Feb 2020 18:03:42 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35047 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727163AbgBSXDm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 19 Feb 2020 18:03:42 -0500
Received: by mail-pl1-f194.google.com with SMTP id g6so721390plt.2
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Feb 2020 15:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=KBNRSaHuPhrAbi2P+lCRgcyG2L2WkNxfhSC3FzIWwd4=;
        b=NnGt5R48IMV6JuNm8BngIKRfboyhJpiChJAXAFvqYZxQxp9UngmwB4zixrGl7DEuiq
         i30M8dYh6/m85It+XaobPMhM+OZDzdLrcYTpsz5vB+7ttE362Zs0OjfXYL7+2ZWO1MPh
         lbts0oFdP5XsTZjHUyamLKD8MscK52ege9zAlB9627G9ZrnG/w58m+mV+tS70DEGGImk
         z0Q9/K6f1/b1Yct34r+YmPaBk1XZ0yAbR9CBHkVzbl1R1ZuMGJXXg9vQsG5ZC4AtWyWD
         wh2HEXrMvQ4OeaPg3syP3O7bjsydw0xqrKFmrgqO9wxDSJ/U2gd6FnkoucCUv1HxCFSo
         p7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=KBNRSaHuPhrAbi2P+lCRgcyG2L2WkNxfhSC3FzIWwd4=;
        b=IX2xHuoPjPv40PGULNjRqxOr+6i8MrhVkNqai/d1oBA/3vLjtRQYgp68OcbI69+GwJ
         TLdOs1OS2ZnyzUlJ2suv25ARVpMDt1AncDPlqB8dzUpWV8fRzNq0DaadWe9Ul2JQa1zb
         jgo8hGcCVZ5BI+SfmMMMZfnVK7oulcuV+NkhtmqTNjYVH4E/M1IIfjPS2mqtlaWVGSqz
         qXxAsH6EbgSdeY0JUg3AGKPzbGiHqV9adz41+DPoBCmnLz1UHtaJ2oXDmbUX49dr0mcE
         qIH7rtRQoNndtzZJoIZSqvP5L5VZZrOY58kgUEQZxOEzWbgqMl/yM3GQEX4Ze66DoMo3
         mu5w==
X-Gm-Message-State: APjAAAUGVLZLPFIR7uQeahHo5bVo44ublS62ZXL/iaUCdcmvEpJHFHra
        1vYFNNozTTQw/wB3Q8Tm0Ru07HRZ
X-Google-Smtp-Source: APXvYqychLEkEJx4/zEr0CmhZS17wI3NRIPCH9xnNZYGttNYV+cCnKLQczBFqgm68cainHiGpkdTSw==
X-Received: by 2002:a17:902:ab81:: with SMTP id f1mr28948406plr.5.1582153419164;
        Wed, 19 Feb 2020 15:03:39 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q8sm651641pfs.161.2020.02.19.15.03.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Feb 2020 15:03:37 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Damien Le Moal <Damien.LeMoal@wdc.com>
Subject: [PATCH] hwmon: (acpi_power_meter) Fix lockdep splat
Date:   Wed, 19 Feb 2020 15:03:35 -0800
Message-Id: <20200219230335.8965-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Damien Le Moal reports a lockdep splat with the acpi_power_meter,
observed with Linux v5.5 and later.

======================================================
WARNING: possible circular locking dependency detected
5.6.0-rc2+ #629 Not tainted
------------------------------------------------------
python/1397 is trying to acquire lock:
ffff888619080070 (&resource->lock){+.+.}, at: show_power+0x3c/0xa0 [acpi_power_meter]

               but task is already holding lock:
ffff88881643f188 (kn->count#119){++++}, at: kernfs_seq_start+0x6a/0x160

               which lock already depends on the new lock.

               the existing dependency chain (in reverse order) is:

               -> #1 (kn->count#119){++++}:
       __kernfs_remove+0x626/0x7e0
       kernfs_remove_by_name_ns+0x41/0x80
       remove_attrs+0xcb/0x3c0 [acpi_power_meter]
       acpi_power_meter_notify+0x1f7/0x310 [acpi_power_meter]
       acpi_ev_notify_dispatch+0x198/0x1f3
       acpi_os_execute_deferred+0x4d/0x70
       process_one_work+0x7c8/0x1340
       worker_thread+0x94/0xc70
       kthread+0x2ed/0x3f0
       ret_from_fork+0x24/0x30

               -> #0 (&resource->lock){+.+.}:
       __lock_acquire+0x20be/0x49b0
       lock_acquire+0x127/0x340
       __mutex_lock+0x15b/0x1350
       show_power+0x3c/0xa0 [acpi_power_meter]
       dev_attr_show+0x3f/0x80
       sysfs_kf_seq_show+0x216/0x410
       seq_read+0x407/0xf90
       vfs_read+0x152/0x2c0
       ksys_read+0xf3/0x1d0
       do_syscall_64+0x95/0x1010
       entry_SYSCALL_64_after_hwframe+0x49/0xbe

               other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(kn->count#119);
                               lock(&resource->lock);
                               lock(kn->count#119);
  lock(&resource->lock);

                *** DEADLOCK ***
4 locks held by python/1397:
 #0: ffff8890242d64e0 (&f->f_pos_lock){+.+.}, at: __fdget_pos+0x9b/0xb0
 #1: ffff889040be74e0 (&p->lock){+.+.}, at: seq_read+0x6b/0xf90
 #2: ffff8890448eb880 (&of->mutex){+.+.}, at: kernfs_seq_start+0x47/0x160
 #3: ffff88881643f188 (kn->count#119){++++}, at: kernfs_seq_start+0x6a/0x160

               stack backtrace:
CPU: 10 PID: 1397 Comm: python Not tainted 5.6.0-rc2+ #629
Hardware name: Supermicro Super Server/X11DPL-i, BIOS 3.1 05/21/2019
Call Trace:
 dump_stack+0x97/0xe0
 check_noncircular+0x32e/0x3e0
 ? print_circular_bug.isra.0+0x1e0/0x1e0
 ? unwind_next_frame+0xb9a/0x1890
 ? entry_SYSCALL_64_after_hwframe+0x49/0xbe
 ? graph_lock+0x79/0x170
 ? __lockdep_reset_lock+0x3c0/0x3c0
 ? mark_lock+0xbc/0x1150
 __lock_acquire+0x20be/0x49b0
 ? mark_held_locks+0xe0/0xe0
 ? stack_trace_save+0x91/0xc0
 lock_acquire+0x127/0x340
 ? show_power+0x3c/0xa0 [acpi_power_meter]
 ? device_remove_bin_file+0x10/0x10
 ? device_remove_bin_file+0x10/0x10
 __mutex_lock+0x15b/0x1350
 ? show_power+0x3c/0xa0 [acpi_power_meter]
 ? show_power+0x3c/0xa0 [acpi_power_meter]
 ? mutex_lock_io_nested+0x11f0/0x11f0
 ? lock_downgrade+0x6a0/0x6a0
 ? kernfs_seq_start+0x47/0x160
 ? lock_acquire+0x127/0x340
 ? kernfs_seq_start+0x6a/0x160
 ? device_remove_bin_file+0x10/0x10
 ? show_power+0x3c/0xa0 [acpi_power_meter]
 show_power+0x3c/0xa0 [acpi_power_meter]
 dev_attr_show+0x3f/0x80
 ? memset+0x20/0x40
 sysfs_kf_seq_show+0x216/0x410
 seq_read+0x407/0xf90
 ? security_file_permission+0x16f/0x2c0
 vfs_read+0x152/0x2c0

Problem is that reading an attribute takes the kernfs lock in the kernfs
code, then resource->lock in the driver. During an ACPI notification, the
opposite happens: The resource lock is taken first, followed by the kernfs
lock when sysfs attributes are removed and re-created. Presumably this is
now seen due to some locking related changes in kernfs after v5.4, but it
was likely always a problem.

Fix the problem by not blindly acquiring the lock in the notification
function. It is only needed to protect the various update functions.
However, those update functions are called anyway when sysfs attributes
are read. This means that we can just stop calling those functions from
the notifier, and the resource lock in the notifier function is no longer
needed.

That leaves two situations:

First, METER_NOTIFY_CONFIG removes and re-allocates capability strings.
While it did so under the resource lock, _displaying_ those strings was not
protected, creating a race condition. To solve this problem, selectively
protect both removal/creation and reporting of capability attributes with
the resource lock.

Second, removing and re-creating the attribute files is no longer protected
by the resource lock. That doesn't matter since access to each individual
attribute is protected by the kernfs lock. Userspace may get messed up if
attributes disappear and reappear under its nose, but that is not different
than today, and there is nothing we can do about it without major driver
restructuring.

Last but not least, when removing the driver, remove attribute functions
first, then release capability strings. This avoids yet another race
condition.

Reported-by: Damien Le Moal <Damien.LeMoal@wdc.com>
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
This is not much more than a kludge, but I think it should do the trick.
Damien, can you give it a try ?

 drivers/hwmon/acpi_power_meter.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
index 4cf25458f0b9..0db8ef4fd6e1 100644
--- a/drivers/hwmon/acpi_power_meter.c
+++ b/drivers/hwmon/acpi_power_meter.c
@@ -355,7 +355,9 @@ static ssize_t show_str(struct device *dev,
 	struct acpi_device *acpi_dev = to_acpi_device(dev);
 	struct acpi_power_meter_resource *resource = acpi_dev->driver_data;
 	acpi_string val;
+	int ret;
 
+	mutex_lock(&resource->lock);
 	switch (attr->index) {
 	case 0:
 		val = resource->model_number;
@@ -372,8 +374,9 @@ static ssize_t show_str(struct device *dev,
 		val = "";
 		break;
 	}
-
-	return sprintf(buf, "%s\n", val);
+	ret = sprintf(buf, "%s\n", val);
+	mutex_unlock(&resource->lock);
+	return ret;
 }
 
 static ssize_t show_val(struct device *dev,
@@ -817,11 +820,12 @@ static void acpi_power_meter_notify(struct acpi_device *device, u32 event)
 
 	resource = acpi_driver_data(device);
 
-	mutex_lock(&resource->lock);
 	switch (event) {
 	case METER_NOTIFY_CONFIG:
+		mutex_lock(&resource->lock);
 		free_capabilities(resource);
 		res = read_capabilities(resource);
+		mutex_unlock(&resource->lock);
 		if (res)
 			break;
 
@@ -830,15 +834,12 @@ static void acpi_power_meter_notify(struct acpi_device *device, u32 event)
 		break;
 	case METER_NOTIFY_TRIP:
 		sysfs_notify(&device->dev.kobj, NULL, POWER_AVERAGE_NAME);
-		update_meter(resource);
 		break;
 	case METER_NOTIFY_CAP:
 		sysfs_notify(&device->dev.kobj, NULL, POWER_CAP_NAME);
-		update_cap(resource);
 		break;
 	case METER_NOTIFY_INTERVAL:
 		sysfs_notify(&device->dev.kobj, NULL, POWER_AVG_INTERVAL_NAME);
-		update_avg_interval(resource);
 		break;
 	case METER_NOTIFY_CAPPING:
 		sysfs_notify(&device->dev.kobj, NULL, POWER_ALARM_NAME);
@@ -848,7 +849,6 @@ static void acpi_power_meter_notify(struct acpi_device *device, u32 event)
 		WARN(1, "Unexpected event %d\n", event);
 		break;
 	}
-	mutex_unlock(&resource->lock);
 
 	acpi_bus_generate_netlink_event(ACPI_POWER_METER_CLASS,
 					dev_name(&device->dev), event, 0);
@@ -912,8 +912,8 @@ static int acpi_power_meter_remove(struct acpi_device *device)
 	resource = acpi_driver_data(device);
 	hwmon_device_unregister(resource->hwmon_dev);
 
-	free_capabilities(resource);
 	remove_attrs(resource);
+	free_capabilities(resource);
 
 	kfree(resource);
 	return 0;
-- 
2.17.1

