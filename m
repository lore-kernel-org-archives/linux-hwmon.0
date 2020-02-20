Return-Path: <SRS0=oaIe=4I=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 672C8C5ACC4
	for <linux-hwmon@archiver.kernel.org>; Thu, 20 Feb 2020 01:02:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 28BE121D56
	for <linux-hwmon@archiver.kernel.org>; Thu, 20 Feb 2020 01:02:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="IAB/Mm+t";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="vYKYRIyN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727086AbgBTBCh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 19 Feb 2020 20:02:37 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:6804 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726962AbgBTBCh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 19 Feb 2020 20:02:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1582160566; x=1613696566;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=6Ec5dTGqkaPz8+gVCmxMoORjns8vxkfp787E9S8SCBs=;
  b=IAB/Mm+tUQE1gWWqYFKXkXcDPK+r9ENs8f3HgEUJm3y+1CLAnxGkliy9
   tFuiu6+TAXlxFk1VIXJYpj4v7VvBeRKLpUTNyDLGp4/YBVh376Y+Zz6Ow
   CrUqiKRWXaKvLsQh+OZn4/ZJRVLQ1yV6gfWWB9p7lJVlv4WW0UYYL/Jus
   2xY7UM0JFK/nuuPIbvwuct/+SEW2Hgr8brU+TjjlUJaltN3zY7fyQGHhl
   P8yd+4CazDBrNds1mzs8+PZ6sW5+idZtL/zOxmvEG6bH/L1yfJgAUQ6GT
   rmSQtMwg59IAORASt13s8AQINNV6QOOM3PadnO/L/1hg+nfDwu2+WTceD
   w==;
IronPort-SDR: MPujk3IfxmDD6e7mAyeTLHW6RJt1Y+/FDT4ChUZM+wlxCyu9ZnRH49T9Bnn86QwqJMymDVP8t7
 D5x2YYzFY2rqeoakGX/DFtGGco1VDPGFTv562u/4+xcrXxLrujCyKCnDnYB1KHfSX5J1QSxB3L
 xEys11rTZyfZhIw3QqMEkbzDKPX99jDmmTeRcyQrNsVXH6AQi1K60JZAQrVWllIq/R6BRfhAp6
 gb5R59cUbKVApR9KSxzAzSgncKyPR9iyNWS9fbRE4/Zqz5uP4f1eo9td9yu9rm6YW02P1cTq7O
 J7g=
X-IronPort-AV: E=Sophos;i="5.70,462,1574092800"; 
   d="scan'208";a="232104868"
Received: from mail-mw2nam10lp2103.outbound.protection.outlook.com (HELO NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.103])
  by ob1.hgst.iphmx.com with ESMTP; 20 Feb 2020 09:02:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CwI7Qkkd9NJC8bej30/EU7q+f5/Zq+Ck+biHJt1pKnKzifWgoXonjcQMEOmR0DC5+Wps6tBvX0yntC51XU5Ch6RwKW2v5zYx3iOOvYyHXjQuWJOq4uf6aBLMgQDa4pdYWTpX5dtzWBqjRBK+zHDXPi4+SxZxw2Mb7vtxrgdECJDPfQ6tqfk3czxcJqB7r8c0mnECxSDeNSGNxxHMDPMAgc52jq6PkZy/15Eis7X6Ry9GoXFTLo6MUYhR7lxa9+1fvpZKBIHoPe9TqCZlqq/CIrvJHlrFIdMDnMC/RAG/nXST175vPcN+x3vxn0jvVwdnvOgAfZCeNBixbIsVJP9MxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6H3dhxizhck/JiDVl9bmMlza7iLVIF8T+zd8l3l1yM=;
 b=DXHI21fSluocjZUknX9sYnsMP5UqhZS1pi0cN71c+B4Cf8FrPHnBsiVwbCNszWknQa0rCLBEaeJikyinIp3NeP8t/KsvRT9o2T1i54+V+4dHJRg10Ex68mts9WSxWsUt3e/N09oJQ3QHncVRdCm8qXUjmQNeLdCxVJTR/+qdMrH6mHJ/1iArtX6NLpNBgkEp5f1lPXDXcgdMcvcusZC+dvJSM0gqX6TgO4nB1IUvlZIhxvdJkr+44PhYTdsyU3V6tj5YcmT/QecLUK1g75FOcuYljs+ZCntb32w/tJfGP8fIwJZFzH2H4B7Bm9QRdxft02+s7E7lwwdODcIR36KyCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6H3dhxizhck/JiDVl9bmMlza7iLVIF8T+zd8l3l1yM=;
 b=vYKYRIyNopWBC9VTARqtlh8BefYKthfqk8jp2xUNXliZ21SHtcKKJRpyi0LYtXji+Hc5VZgrwsewylORhx/81b4G7WXxN9WrhPiP0Lb/q71XwE8CgPe5YB2jkaGnrCebe5pPeV6wB4CiWSWeI9+wBXU1HewPT9ra5ycYXjJYCrY=
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.59.16) by
 BYAPR04MB4277.namprd04.prod.outlook.com (20.176.252.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.31; Thu, 20 Feb 2020 01:02:35 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
 ([fe80::6daf:1b7c:1a61:8cb2]) by BYAPR04MB5816.namprd04.prod.outlook.com
 ([fe80::6daf:1b7c:1a61:8cb2%6]) with mapi id 15.20.2729.033; Thu, 20 Feb 2020
 01:02:35 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Hardware Monitoring <linux-hwmon@vger.kernel.org>
CC:     Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] hwmon: (acpi_power_meter) Fix lockdep splat
Thread-Topic: [PATCH] hwmon: (acpi_power_meter) Fix lockdep splat
Thread-Index: AQHV53jVbMZGHBo/GkWHt4lTmun0ag==
Date:   Thu, 20 Feb 2020 01:02:35 +0000
Message-ID: <BYAPR04MB581676E8431260FC639EB09BE7130@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20200219230335.8965-1-linux@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [199.255.47.9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 29dbe417-f3aa-4802-9268-08d7b5a092a4
x-ms-traffictypediagnostic: BYAPR04MB4277:
x-microsoft-antispam-prvs: <BYAPR04MB427708F77D1E72836B233DAAE7130@BYAPR04MB4277.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 031996B7EF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(199004)(189003)(52536014)(66476007)(66556008)(2906002)(71200400001)(4326008)(55016002)(64756008)(66446008)(9686003)(478600001)(91956017)(76116006)(33656002)(186003)(53546011)(86362001)(8936002)(8676002)(5660300002)(6506007)(110136005)(7696005)(66946007)(81166006)(81156014)(316002)(26005);DIR:OUT;SFP:1102;SCL:1;SRVR:BYAPR04MB4277;H:BYAPR04MB5816.namprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oKSbN1boB2UMa8DNcAv6aWCyfpJvlASyMlBs9ZDlkCLcGkp9kUd9FblRV1XbTXXikGygFvPcDa2EmhpAS/YgggnvjVCLZ1bu8mRunjnrXl264YbubOE8TLyhCmb1YycnrIuyEN75PoBoHh5iOWSk3qNr5V6GEcNowvYXpKYKQA2rWlJl1pxpV4SgnNheWxvjVvnZJ88eNbJF/hBktOM2BwOO7ftwZiL6l/6uF5Ez8eUqA/PZV5TFcP9LSKgzNy9jYmTZ3a1AiuXjZvnkqZtvtWiyyLCX5Ta4VkphU77MoIJ7hDdSNTPp56kIr2KNJifIaLfdUG1J2kf93D1MlIFYTlVnFRa4J9+1tkJAwKNU1lvEyg0qV8kbumFqt4ganM0B8RnI1bww5uY+tj/t5h2xB7g+u7Ee9dN0gl6vJZSPjDgjKtPuqtwfwA3dSjBPZEEG
x-ms-exchange-antispam-messagedata: 7RPXhCtMtpwvkQ+xqeX+F9b4TnD+lrs1P4DuhMedi2Q38sTeHR/HdCR0Dr6d3WluE0+ulep8caFc0j+TogYhgZqub1f6//Yb4tITki6L0IWj1sIMBlKlXkV+hE+SLD21l6lk2IFpA3HL0Sp7SiASDQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29dbe417-f3aa-4802-9268-08d7b5a092a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2020 01:02:35.4708
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tr5ylQGO08KxFMAAs6vxzBjrEnbPO/i1wmM9u+Det3VpdtBE8evov05815L635eSYUnUWPhDQxJrjXPQVR2lSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4277
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2020/02/20 8:03, Guenter Roeck wrote:=0A=
> Damien Le Moal reports a lockdep splat with the acpi_power_meter,=0A=
> observed with Linux v5.5 and later.=0A=
> =0A=
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=0A=
> WARNING: possible circular locking dependency detected=0A=
> 5.6.0-rc2+ #629 Not tainted=0A=
> ------------------------------------------------------=0A=
> python/1397 is trying to acquire lock:=0A=
> ffff888619080070 (&resource->lock){+.+.}, at: show_power+0x3c/0xa0 [acpi_=
power_meter]=0A=
> =0A=
>                but task is already holding lock:=0A=
> ffff88881643f188 (kn->count#119){++++}, at: kernfs_seq_start+0x6a/0x160=
=0A=
> =0A=
>                which lock already depends on the new lock.=0A=
> =0A=
>                the existing dependency chain (in reverse order) is:=0A=
> =0A=
>                -> #1 (kn->count#119){++++}:=0A=
>        __kernfs_remove+0x626/0x7e0=0A=
>        kernfs_remove_by_name_ns+0x41/0x80=0A=
>        remove_attrs+0xcb/0x3c0 [acpi_power_meter]=0A=
>        acpi_power_meter_notify+0x1f7/0x310 [acpi_power_meter]=0A=
>        acpi_ev_notify_dispatch+0x198/0x1f3=0A=
>        acpi_os_execute_deferred+0x4d/0x70=0A=
>        process_one_work+0x7c8/0x1340=0A=
>        worker_thread+0x94/0xc70=0A=
>        kthread+0x2ed/0x3f0=0A=
>        ret_from_fork+0x24/0x30=0A=
> =0A=
>                -> #0 (&resource->lock){+.+.}:=0A=
>        __lock_acquire+0x20be/0x49b0=0A=
>        lock_acquire+0x127/0x340=0A=
>        __mutex_lock+0x15b/0x1350=0A=
>        show_power+0x3c/0xa0 [acpi_power_meter]=0A=
>        dev_attr_show+0x3f/0x80=0A=
>        sysfs_kf_seq_show+0x216/0x410=0A=
>        seq_read+0x407/0xf90=0A=
>        vfs_read+0x152/0x2c0=0A=
>        ksys_read+0xf3/0x1d0=0A=
>        do_syscall_64+0x95/0x1010=0A=
>        entry_SYSCALL_64_after_hwframe+0x49/0xbe=0A=
> =0A=
>                other info that might help us debug this:=0A=
> =0A=
>  Possible unsafe locking scenario:=0A=
> =0A=
>        CPU0                    CPU1=0A=
>        ----                    ----=0A=
>   lock(kn->count#119);=0A=
>                                lock(&resource->lock);=0A=
>                                lock(kn->count#119);=0A=
>   lock(&resource->lock);=0A=
> =0A=
>                 *** DEADLOCK ***=0A=
> 4 locks held by python/1397:=0A=
>  #0: ffff8890242d64e0 (&f->f_pos_lock){+.+.}, at: __fdget_pos+0x9b/0xb0=
=0A=
>  #1: ffff889040be74e0 (&p->lock){+.+.}, at: seq_read+0x6b/0xf90=0A=
>  #2: ffff8890448eb880 (&of->mutex){+.+.}, at: kernfs_seq_start+0x47/0x160=
=0A=
>  #3: ffff88881643f188 (kn->count#119){++++}, at: kernfs_seq_start+0x6a/0x=
160=0A=
> =0A=
>                stack backtrace:=0A=
> CPU: 10 PID: 1397 Comm: python Not tainted 5.6.0-rc2+ #629=0A=
> Hardware name: Supermicro Super Server/X11DPL-i, BIOS 3.1 05/21/2019=0A=
> Call Trace:=0A=
>  dump_stack+0x97/0xe0=0A=
>  check_noncircular+0x32e/0x3e0=0A=
>  ? print_circular_bug.isra.0+0x1e0/0x1e0=0A=
>  ? unwind_next_frame+0xb9a/0x1890=0A=
>  ? entry_SYSCALL_64_after_hwframe+0x49/0xbe=0A=
>  ? graph_lock+0x79/0x170=0A=
>  ? __lockdep_reset_lock+0x3c0/0x3c0=0A=
>  ? mark_lock+0xbc/0x1150=0A=
>  __lock_acquire+0x20be/0x49b0=0A=
>  ? mark_held_locks+0xe0/0xe0=0A=
>  ? stack_trace_save+0x91/0xc0=0A=
>  lock_acquire+0x127/0x340=0A=
>  ? show_power+0x3c/0xa0 [acpi_power_meter]=0A=
>  ? device_remove_bin_file+0x10/0x10=0A=
>  ? device_remove_bin_file+0x10/0x10=0A=
>  __mutex_lock+0x15b/0x1350=0A=
>  ? show_power+0x3c/0xa0 [acpi_power_meter]=0A=
>  ? show_power+0x3c/0xa0 [acpi_power_meter]=0A=
>  ? mutex_lock_io_nested+0x11f0/0x11f0=0A=
>  ? lock_downgrade+0x6a0/0x6a0=0A=
>  ? kernfs_seq_start+0x47/0x160=0A=
>  ? lock_acquire+0x127/0x340=0A=
>  ? kernfs_seq_start+0x6a/0x160=0A=
>  ? device_remove_bin_file+0x10/0x10=0A=
>  ? show_power+0x3c/0xa0 [acpi_power_meter]=0A=
>  show_power+0x3c/0xa0 [acpi_power_meter]=0A=
>  dev_attr_show+0x3f/0x80=0A=
>  ? memset+0x20/0x40=0A=
>  sysfs_kf_seq_show+0x216/0x410=0A=
>  seq_read+0x407/0xf90=0A=
>  ? security_file_permission+0x16f/0x2c0=0A=
>  vfs_read+0x152/0x2c0=0A=
> =0A=
> Problem is that reading an attribute takes the kernfs lock in the kernfs=
=0A=
> code, then resource->lock in the driver. During an ACPI notification, the=
=0A=
> opposite happens: The resource lock is taken first, followed by the kernf=
s=0A=
> lock when sysfs attributes are removed and re-created. Presumably this is=
=0A=
> now seen due to some locking related changes in kernfs after v5.4, but it=
=0A=
> was likely always a problem.=0A=
> =0A=
> Fix the problem by not blindly acquiring the lock in the notification=0A=
> function. It is only needed to protect the various update functions.=0A=
> However, those update functions are called anyway when sysfs attributes=
=0A=
> are read. This means that we can just stop calling those functions from=
=0A=
> the notifier, and the resource lock in the notifier function is no longer=
=0A=
> needed.=0A=
> =0A=
> That leaves two situations:=0A=
> =0A=
> First, METER_NOTIFY_CONFIG removes and re-allocates capability strings.=
=0A=
> While it did so under the resource lock, _displaying_ those strings was n=
ot=0A=
> protected, creating a race condition. To solve this problem, selectively=
=0A=
> protect both removal/creation and reporting of capability attributes with=
=0A=
> the resource lock.=0A=
> =0A=
> Second, removing and re-creating the attribute files is no longer protect=
ed=0A=
> by the resource lock. That doesn't matter since access to each individual=
=0A=
> attribute is protected by the kernfs lock. Userspace may get messed up if=
=0A=
> attributes disappear and reappear under its nose, but that is not differe=
nt=0A=
> than today, and there is nothing we can do about it without major driver=
=0A=
> restructuring.=0A=
> =0A=
> Last but not least, when removing the driver, remove attribute functions=
=0A=
> first, then release capability strings. This avoids yet another race=0A=
> condition.=0A=
> =0A=
> Reported-by: Damien Le Moal <Damien.LeMoal@wdc.com>=0A=
> Cc: Damien Le Moal <Damien.LeMoal@wdc.com>=0A=
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>=0A=
> ---=0A=
> This is not much more than a kludge, but I think it should do the trick.=
=0A=
> Damien, can you give it a try ?=0A=
=0A=
Just tested with latest rc2. Rebooted several times and did not see any=0A=
splat with the patch applied. So please feel free to add:=0A=
=0A=
Tested-by: Damien Le Moal <damien.lemoal@wdc.com>=0A=
=0A=
Thanks !=0A=
=0A=
> =0A=
>  drivers/hwmon/acpi_power_meter.c | 16 ++++++++--------=0A=
>  1 file changed, 8 insertions(+), 8 deletions(-)=0A=
> =0A=
> diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_=
meter.c=0A=
> index 4cf25458f0b9..0db8ef4fd6e1 100644=0A=
> --- a/drivers/hwmon/acpi_power_meter.c=0A=
> +++ b/drivers/hwmon/acpi_power_meter.c=0A=
> @@ -355,7 +355,9 @@ static ssize_t show_str(struct device *dev,=0A=
>  	struct acpi_device *acpi_dev =3D to_acpi_device(dev);=0A=
>  	struct acpi_power_meter_resource *resource =3D acpi_dev->driver_data;=
=0A=
>  	acpi_string val;=0A=
> +	int ret;=0A=
>  =0A=
> +	mutex_lock(&resource->lock);=0A=
>  	switch (attr->index) {=0A=
>  	case 0:=0A=
>  		val =3D resource->model_number;=0A=
> @@ -372,8 +374,9 @@ static ssize_t show_str(struct device *dev,=0A=
>  		val =3D "";=0A=
>  		break;=0A=
>  	}=0A=
> -=0A=
> -	return sprintf(buf, "%s\n", val);=0A=
> +	ret =3D sprintf(buf, "%s\n", val);=0A=
> +	mutex_unlock(&resource->lock);=0A=
> +	return ret;=0A=
>  }=0A=
>  =0A=
>  static ssize_t show_val(struct device *dev,=0A=
> @@ -817,11 +820,12 @@ static void acpi_power_meter_notify(struct acpi_dev=
ice *device, u32 event)=0A=
>  =0A=
>  	resource =3D acpi_driver_data(device);=0A=
>  =0A=
> -	mutex_lock(&resource->lock);=0A=
>  	switch (event) {=0A=
>  	case METER_NOTIFY_CONFIG:=0A=
> +		mutex_lock(&resource->lock);=0A=
>  		free_capabilities(resource);=0A=
>  		res =3D read_capabilities(resource);=0A=
> +		mutex_unlock(&resource->lock);=0A=
>  		if (res)=0A=
>  			break;=0A=
>  =0A=
> @@ -830,15 +834,12 @@ static void acpi_power_meter_notify(struct acpi_dev=
ice *device, u32 event)=0A=
>  		break;=0A=
>  	case METER_NOTIFY_TRIP:=0A=
>  		sysfs_notify(&device->dev.kobj, NULL, POWER_AVERAGE_NAME);=0A=
> -		update_meter(resource);=0A=
>  		break;=0A=
>  	case METER_NOTIFY_CAP:=0A=
>  		sysfs_notify(&device->dev.kobj, NULL, POWER_CAP_NAME);=0A=
> -		update_cap(resource);=0A=
>  		break;=0A=
>  	case METER_NOTIFY_INTERVAL:=0A=
>  		sysfs_notify(&device->dev.kobj, NULL, POWER_AVG_INTERVAL_NAME);=0A=
> -		update_avg_interval(resource);=0A=
>  		break;=0A=
>  	case METER_NOTIFY_CAPPING:=0A=
>  		sysfs_notify(&device->dev.kobj, NULL, POWER_ALARM_NAME);=0A=
> @@ -848,7 +849,6 @@ static void acpi_power_meter_notify(struct acpi_devic=
e *device, u32 event)=0A=
>  		WARN(1, "Unexpected event %d\n", event);=0A=
>  		break;=0A=
>  	}=0A=
> -	mutex_unlock(&resource->lock);=0A=
>  =0A=
>  	acpi_bus_generate_netlink_event(ACPI_POWER_METER_CLASS,=0A=
>  					dev_name(&device->dev), event, 0);=0A=
> @@ -912,8 +912,8 @@ static int acpi_power_meter_remove(struct acpi_device=
 *device)=0A=
>  	resource =3D acpi_driver_data(device);=0A=
>  	hwmon_device_unregister(resource->hwmon_dev);=0A=
>  =0A=
> -	free_capabilities(resource);=0A=
>  	remove_attrs(resource);=0A=
> +	free_capabilities(resource);=0A=
>  =0A=
>  	kfree(resource);=0A=
>  	return 0;=0A=
> =0A=
=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=
