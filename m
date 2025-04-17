Received: from mail.as397444.net (mail.as397444.net [69.59.18.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D2D347B4
	for <linux-hwmon@vger.kernel.org>; Thu, 17 Apr 2025 16:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=69.59.18.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744906087; cv=none; b=MMIIMmraSk/ZlLyacw97u90mumjb5dFt0kt6GgIRnN1rE4QUVuHuHhCOn/Zf+x7u8KjyYbU3W+l18bErJxPZQt2XpQKMcX8V4cWaqBPjhu1qWbZbS9i1H3CZOiw9Ffgc4XR912eeDQqCxd2dAO5ScPBaWU76BGLjzYvqzGELnEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744906087; c=relaxed/simple;
	bh=igBp5/yWJwdMAngHPFz552QBEPTUOiIRz5mJ3Q8RbZQ=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=bIlytcgzv8a0lbz0EBwV7R8zo9tULKnS1a8UefHDK61rRHbHRF7ohlTplyHs/R4yWZBuWIGFuYdNSBFW5mkLKjDNN0Tp3MlBh1W2EWI7IzU3rZ5mOYE1xEPYu/8PPZWRFcmhA6o9MiPkyZA+149hYcjS9caPLoiWNgw8QF5omEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mattcorallo.com; spf=pass smtp.mailfrom=mattcorallo.com; dkim=pass (2048-bit key) header.d=mattcorallo.com header.i=@mattcorallo.com header.b=FtGPHr+x; dkim=pass (2048-bit key) header.d=clients.mail.as397444.net header.i=@clients.mail.as397444.net header.b=BjtBcSPu; arc=none smtp.client-ip=69.59.18.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mattcorallo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mattcorallo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mattcorallo.com header.i=@mattcorallo.com header.b="FtGPHr+x";
	dkim=pass (2048-bit key) header.d=clients.mail.as397444.net header.i=@clients.mail.as397444.net header.b="BjtBcSPu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mattcorallo.com; s=1744904462; h=Subject:From:To:From:Subject:To:Cc:Cc:
	Reply-To:In-Reply-To:References;
	bh=hfk7qVQrs5+0gtfIJBulsYL5ggYTJQy11droRlyS2Ig=; b=FtGPHr+xT2PwSk7l1AVXn3rhrx
	LV5Gw8S5Uy1BfQXN9M1OaKkQ9kZnfLXEvfDIk+GLosPWUh3BvxucdINg9Ifkx4vYmuKFH4Ow3GNSa
	xtcGgdd+220KwUe0ArKRyvp+dQ9pBmr8s/VtWaSn09C70BkXheflXUkij9/CqkMrRkxf4ixeJ2K24
	yovoX8YNm/v3IhaxYILs6js2asOmeB3j8j3St0m8rnQSaqDq25lYFe1Rk5zr4v0b9fXVqGfp2IIts
	BsvF18LHjIgsjLSLqsP43iTc+h5cCDVvR5io5BMRAM1/K+Z3gvPYs+nUx+929VDwZQmHh6DxSA42v
	KoNjhlDA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=clients.mail.as397444.net; s=1744904464; h=Subject:From:To:From:Subject:To:
	Cc:Cc:Reply-To:In-Reply-To:References;
	bh=hfk7qVQrs5+0gtfIJBulsYL5ggYTJQy11droRlyS2Ig=; b=BjtBcSPufrzJyoyYcfr5gyyF52
	E9/9GW6XdU/3T3NTIAVtxIBLE3TANrrdBYn466uW89dPIKclYkGeNzbepODZbWHkU69bDoDYPHNGl
	6lAIhsChNTKX7vDiMSmXm1egwUA5h8GkEKRcstr5zqSWN7aQ86dXe7KQASIC7YCSGscNIcfwyfnOf
	Qn0pX8P60O2xokeDi/K0D2QurpxRIOiAchuK1ati0Ug7+uUqATYtOAmchbCtaJJV83le5RI3lPIgj
	U97+TbkFg8Jpy11Qn4OxYCaoMCmhRQYWG7klrf/p2e+/y6iqulhPg3BywqsjY1XgrXjRJrd0jruV/
	hYHGhEXQ==;
X-DKIM-Note: Keys used to sign are likely public at
X-DKIM-Note: https://as397444.net/dkim/mattcorallo.com and
X-DKIM-Note: https://as397444.net/dkim/clients.mail.as397444.net
X-DKIM-Note: For more info, see https://as397444.net/dkim/
Received: by mail.as397444.net with esmtpsa (TLS1.3) (Exim)
	(envelope-from <yalbrymrb@mattcorallo.com>)
	id 1u5RKe-009KSR-0b for linux-hwmon@vger.kernel.org;
	Thu, 17 Apr 2025 15:39:16 +0000
Message-ID: <985cd95f-155b-4b8a-9fe7-59938d0c2b8f@mattcorallo.com>
Date: Thu, 17 Apr 2025 11:39:14 -0400
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: en-US
To: linux-hwmon@vger.kernel.org
From: Matt Corallo <yalbrymrb@mattcorallo.com>
Subject: PMBus memory overflow
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

When adding the PMBus entry for a FSP520-20RAB (actually FSP Twins Pro but it appears to be 
identical hardware with a provided SMBus -> USB adapter and it self-reports as an FSP520-20RAB when 
queried over PMBus using the old pmbus_peek.c script) with `echo pmbus 0x59 > 
/sys/bus/i2c/devices/i2c-3/new_device` I got the following BUG_ON (on Proxmox's 6.8.12-8-pve 
kernel). Its redundant and reports back fine on 0x60 and 0x59 for both of its modules (using 
pmbus_peek.c) and I'd already added 0x60 and it BUG'd adding the second module at 0x59.

Apr 17 15:31:19 rackchill-refresh kernel: detected buffer overflow in memcpy
Apr 17 15:31:19 rackchill-refresh kernel: ------------[ cut here ]------------
Apr 17 15:31:19 rackchill-refresh kernel: kernel BUG at lib/string_helpers.c:1048!
Apr 17 15:31:19 rackchill-refresh kernel: invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
Apr 17 15:31:19 rackchill-refresh kernel: CPU: 18 PID: 387839 Comm: bash Tainted: P           O 
  6.8.12-8-pve #1
Apr 17 15:31:19 rackchill-refresh kernel: Hardware name: Supermicro Super Server/X13SAE-F, BIOS 4.1 
10/01/2024
Apr 17 15:31:19 rackchill-refresh kernel: RIP: 0010:fortify_panic+0x13/0x20
Apr 17 15:31:19 rackchill-refresh kernel: Code: cc 66 0f 1f 44 00 00 90 90 90 90 90 90 90 90 90 90 
90 90 90 90 90 90 55 48 89 fe 48 c7 c7 b0 4e bf 90 48 89 e5 e8 4d f6 9a ff <0f> 0b 66 66 2e 0f 1f 84 
00 00 00 00 00 90 90 90 90 90 90 90 90 90
Apr 17 15:31:19 rackchill-refresh kernel: RSP: 0018:ffffab56ae19f708 EFLAGS: 00010246
Apr 17 15:31:19 rackchill-refresh kernel: RAX: 0000000000000022 RBX: ffffab56ae19f766 RCX: 
0000000000000000
Apr 17 15:31:19 rackchill-refresh kernel: RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
0000000000000000
Apr 17 15:31:19 rackchill-refresh kernel: RBP: ffffab56ae19f708 R08: 0000000000000000 R09: 
0000000000000000
Apr 17 15:31:19 rackchill-refresh kernel: R10: 0000000000000000 R11: 0000000000000000 R12: 
ffff8a76f8c98428
Apr 17 15:31:19 rackchill-refresh kernel: R13: ffff8a7481989400 R14: 000000000000009b R15: 
ffff8a8f6fe1a428
Apr 17 15:31:19 rackchill-refresh kernel: FS:  00007f3e871a1740(0000) GS:ffff8a937fd00000(0000) 
knlGS:0000000000000000
Apr 17 15:31:19 rackchill-refresh kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Apr 17 15:31:19 rackchill-refresh kernel: CR2: 00007ff6328e0000 CR3: 00000011f6ba0002 CR4: 
0000000000f72ef0
Apr 17 15:31:19 rackchill-refresh kernel: PKRU: 55555554
Apr 17 15:31:19 rackchill-refresh kernel: Call Trace:
Apr 17 15:31:19 rackchill-refresh kernel:  <TASK>
Apr 17 15:31:19 rackchill-refresh kernel:  ? show_regs+0x6d/0x80
Apr 17 15:31:19 rackchill-refresh kernel:  ? die+0x37/0xa0
Apr 17 15:31:19 rackchill-refresh kernel:  ? do_trap+0xd4/0xf0
Apr 17 15:31:19 rackchill-refresh kernel:  ? do_error_trap+0x71/0xb0
Apr 17 15:31:19 rackchill-refresh kernel:  ? fortify_panic+0x13/0x20
Apr 17 15:31:19 rackchill-refresh kernel:  ? exc_invalid_op+0x52/0x80
Apr 17 15:31:19 rackchill-refresh kernel:  ? fortify_panic+0x13/0x20
Apr 17 15:31:19 rackchill-refresh kernel:  ? asm_exc_invalid_op+0x1b/0x20
Apr 17 15:31:19 rackchill-refresh kernel:  ? fortify_panic+0x13/0x20
Apr 17 15:31:19 rackchill-refresh kernel:  ? fortify_panic+0x13/0x20
Apr 17 15:31:19 rackchill-refresh kernel:  i2c_smbus_read_block_data+0x116/0x120
Apr 17 15:31:19 rackchill-refresh kernel:  pmbus_check_block_register.constprop.0+0x77/0x100 
[pmbus_core]
Apr 17 15:31:19 rackchill-refresh kernel:  pmbus_do_probe+0x11a5/0x1e00 [pmbus_core]
Apr 17 15:31:19 rackchill-refresh kernel:  ? __kmalloc_node_track_caller+0x1c9/0x430
Apr 17 15:31:19 rackchill-refresh kernel:  ? devres_add+0x6f/0xf0
Apr 17 15:31:19 rackchill-refresh kernel:  pmbus_probe+0x74/0xb0 [pmbus]
Apr 17 15:31:19 rackchill-refresh kernel:  i2c_device_probe+0x13b/0x300
Apr 17 15:31:19 rackchill-refresh kernel:  really_probe+0x1c9/0x430
Apr 17 15:31:19 rackchill-refresh kernel:  __driver_probe_device+0x8c/0x190
Apr 17 15:31:19 rackchill-refresh kernel:  driver_probe_device+0x24/0xd0
Apr 17 15:31:19 rackchill-refresh kernel:  __device_attach_driver+0xcd/0x170
Apr 17 15:31:19 rackchill-refresh kernel:  ? __pfx___device_attach_driver+0x10/0x10
Apr 17 15:31:19 rackchill-refresh kernel:  bus_for_each_drv+0x94/0xf0
Apr 17 15:31:19 rackchill-refresh kernel:  __device_attach+0xb6/0x1d0
Apr 17 15:31:19 rackchill-refresh kernel:  device_initial_probe+0x13/0x20
Apr 17 15:31:19 rackchill-refresh kernel:  bus_probe_device+0x9f/0xb0
Apr 17 15:31:19 rackchill-refresh kernel:  device_add+0x6d7/0x8f0
Apr 17 15:31:19 rackchill-refresh kernel:  ? hrtimer_init+0x27/0x90
Apr 17 15:31:19 rackchill-refresh kernel:  device_register+0x1a/0x30
Apr 17 15:31:19 rackchill-refresh kernel:  i2c_new_client_device+0x1fb/0x3f0
Apr 17 15:31:19 rackchill-refresh kernel:  new_device_store+0x113/0x290
Apr 17 15:31:19 rackchill-refresh kernel:  dev_attr_store+0x14/0x40
Apr 17 15:31:19 rackchill-refresh kernel:  sysfs_kf_write+0x3b/0x60
Apr 17 15:31:19 rackchill-refresh kernel:  kernfs_fop_write_iter+0x130/0x210
Apr 17 15:31:19 rackchill-refresh kernel:  vfs_write+0x2a5/0x480
Apr 17 15:31:19 rackchill-refresh kernel:  ksys_write+0x73/0x100
Apr 17 15:31:19 rackchill-refresh kernel:  __x64_sys_write+0x19/0x30
Apr 17 15:31:19 rackchill-refresh kernel:  x64_sys_call+0x200f/0x2480
Apr 17 15:31:19 rackchill-refresh kernel:  do_syscall_64+0x81/0x170
Apr 17 15:31:19 rackchill-refresh kernel:  ? __handle_mm_fault+0xba9/0xf70
Apr 17 15:31:19 rackchill-refresh kernel:  ? __count_memcg_events+0x6f/0xe0
Apr 17 15:31:19 rackchill-refresh kernel:  ? count_memcg_events.constprop.0+0x2a/0x50
Apr 17 15:31:19 rackchill-refresh kernel:  ? handle_mm_fault+0xad/0x380
Apr 17 15:31:19 rackchill-refresh kernel:  ? do_user_addr_fault+0x33e/0x660
Apr 17 15:31:19 rackchill-refresh kernel:  ? irqentry_exit_to_user_mode+0x7b/0x260
Apr 17 15:31:19 rackchill-refresh kernel:  ? irqentry_exit+0x43/0x50
Apr 17 15:31:19 rackchill-refresh kernel:  ? exc_page_fault+0x94/0x1b0
Apr 17 15:31:19 rackchill-refresh kernel:  entry_SYSCALL_64_after_hwframe+0x78/0x80
Apr 17 15:31:19 rackchill-refresh kernel: RIP: 0033:0x7f3e8729c300
Apr 17 15:31:19 rackchill-refresh kernel: Code: 40 00 48 8b 15 01 9b 0d 00 f7 d8 64 89 02 48 c7 c0 
ff ff ff ff eb b7 0f 1f 00 80 3d e1 22 0e 00 00 74 17 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 58 
c3 0f 1f 80 00 00 00 00 48 83 ec 28 48 89
Apr 17 15:31:19 rackchill-refresh kernel: RSP: 002b:00007ffcd6171828 EFLAGS: 00000202 ORIG_RAX: 
0000000000000001
Apr 17 15:31:19 rackchill-refresh kernel: RAX: ffffffffffffffda RBX: 000000000000000b RCX: 
00007f3e8729c300
Apr 17 15:31:19 rackchill-refresh kernel: RDX: 000000000000000b RSI: 00005a5e6f9bb6f0 RDI: 
0000000000000001
Apr 17 15:31:19 rackchill-refresh kernel: RBP: 00005a5e6f9bb6f0 R08: 0000000000000007 R09: 
0000000000000073
Apr 17 15:31:19 rackchill-refresh kernel: R10: 0000000000000000 R11: 0000000000000202 R12: 
000000000000000b
Apr 17 15:31:19 rackchill-refresh kernel: R13: 00007f3e87377760 R14: 000000000000000b R15: 
00007f3e873729e0
Apr 17 15:31:19 rackchill-refresh kernel:  </TASK>
Apr 17 15:31:19 rackchill-refresh kernel: Modules linked in: pmbus pmbus_core tcp_diag inet_diag 
ebt_arp xt_mac veth rbd ceph libceph cmac nls_utf8 cifs cifs_arc4 nls_ucs2_utils rdma_cm iw_cm ib_cm 
cifs_md4 netfs ebtable_filter ebtables ip6table_raw ip6t_REJECT nf_reject_ipv6 ip6table_filter 
ip6_tables iptable_raw ipt_REJECT nf_reject_ipv4 xt_mark xt_set xt_physdev xt_addrtype xt_comment 
xt_multiport xt_conntrack nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 xt_tcpudp iptable_filter 
ip_set_hash_net ip_set sctp ip6_udp_tunnel udp_tunnel nf_tables nvme_fabrics nvme_keyring bonding 
sunrpc softdog nfnetlink_log binfmt_misc nfnetlink intel_rapl_msr intel_rapl_common 
intel_uncore_frequency intel_uncore_frequency_common snd_sof_pci_intel_tgl snd_sof_intel_hda_common 
soundwire_intel snd_sof_intel_hda_mlink soundwire_cadence snd_sof_intel_hda x86_pkg_temp_thermal 
snd_sof_pci intel_powerclamp snd_sof_xtensa_dsp snd_sof snd_sof_utils snd_soc_hdac_hda coretemp 
snd_hda_ext_core snd_soc_acpi_intel_match snd_soc_acpi soundwire_generic_allocation soundwire_bus
Apr 17 15:31:19 rackchill-refresh kernel:  kvm_intel snd_soc_core snd_hda_codec_realtek snd_compress 
ac97_bus snd_hda_codec_generic snd_pcm_dmaengine snd_hda_intel kvm snd_intel_dspcfg 
snd_intel_sdw_acpi snd_hda_codec snd_hda_core ipmi_ssif irqbypass snd_hwdep mei_hdcp mei_pxp 
cmdlinepart snd_pcm spi_nor snd_timer rapl ast snd acpi_ipmi intel_cstate ucsi_acpi mtd wmi_bmof 
i2c_algo_bit soundcore mei_me pcspkr intel_pmc_core typec_ucsi ipmi_si mei ipmi_devintf intel_vsec 
typec pmt_telemetry ipmi_msghandler pmt_class acpi_pad acpi_tad joydev input_leds mac_hid zfs(PO) 
spl(O) vhost_net vhost vhost_iotlb tap nct6775 nct6775_core hwmon_vid efi_pstore dmi_sysfs ip_tables 
x_tables autofs4 btrfs blake2b_generic xor raid6_pq libcrc32c dm_crypt mlx5_ib ib_uverbs macsec 
ib_core rndis_host cdc_ether usbnet mii usbmouse hid_cp2112 hid_generic usbhid hid crct10dif_pclmul 
mlx5_core crc32_pclmul polyval_clmulni nvme xhci_pci polyval_generic ghash_clmulni_intel 
xhci_pci_renesas sha256_ssse3 sha1_ssse3 e1000e intel_lpss_pci mlxfw nvme_core i2c_i801 ahci igc psample
Apr 17 15:31:19 rackchill-refresh kernel:  intel_lpss spi_intel_pci xhci_hcd spi_intel i2c_smbus tls 
idma64 nvme_auth libahci pci_hyperv_intf video pinctrl_alderlake wmi aesni_intel crypto_simd cryptd
Apr 17 15:31:19 rackchill-refresh kernel: ---[ end trace 0000000000000000 ]---
Apr 17 15:31:19 rackchill-refresh kernel: RIP: 0010:fortify_panic+0x13/0x20
Apr 17 15:31:19 rackchill-refresh kernel: Code: cc 66 0f 1f 44 00 00 90 90 90 90 90 90 90 90 90 90 
90 90 90 90 90 90 55 48 89 fe 48 c7 c7 b0 4e bf 90 48 89 e5 e8 4d f6 9a ff <0f> 0b 66 66 2e 0f 1f 84 
00 00 00 00 00 90 90 90 90 90 90 90 90 90
Apr 17 15:31:19 rackchill-refresh kernel: RSP: 0018:ffffab56ae19f708 EFLAGS: 00010246
Apr 17 15:31:19 rackchill-refresh kernel: RAX: 0000000000000022 RBX: ffffab56ae19f766 RCX: 
0000000000000000
Apr 17 15:31:19 rackchill-refresh kernel: RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
0000000000000000
Apr 17 15:31:19 rackchill-refresh kernel: RBP: ffffab56ae19f708 R08: 0000000000000000 R09: 
0000000000000000
Apr 17 15:31:19 rackchill-refresh kernel: R10: 0000000000000000 R11: 0000000000000000 R12: 
ffff8a76f8c98428
Apr 17 15:31:19 rackchill-refresh kernel: R13: ffff8a7481989400 R14: 000000000000009b R15: 
ffff8a8f6fe1a428
Apr 17 15:31:19 rackchill-refresh kernel: FS:  00007f3e871a1740(0000) GS:ffff8a937fd00000(0000) 
knlGS:0000000000000000
Apr 17 15:31:19 rackchill-refresh kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Apr 17 15:31:19 rackchill-refresh kernel: CR2: 00007ff6328e0000 CR3: 00000011f6ba0002 CR4: 
0000000000f72ef0
Apr 17 15:31:19 rackchill-refresh kernel: PKRU: 55555554
