/****************************************************************************
 ****************************************************************************
 ***
 ***   This header was automatically generated from a Linux kernel header
 ***   of the same name, to make information necessary for userspace to
 ***   call into the kernel available to libc.  It contains only constants,
 ***   structures, and macros generated from the original header, and thus,
 ***   contains no copyrightable information.
 ***
 ***   To edit the content of this header, modify the corresponding
 ***   source file (e.g. under external/kernel-headers/original/) then
 ***   run bionic/libc/kernel/tools/update_all.py
 ***
 ***   Any manual change here will be lost the next time this script will
 ***   be run. You've been warned!
 ***
 ****************************************************************************
 ****************************************************************************/
#ifndef KCT_H_
#define KCT_H_
#include <linux/netlink.h>
#define EV_FLAGS_PRIORITY_LOW (1<<0)
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
#ifndef MAX_SB_N
#define MAX_SB_N 32
#endif
#ifndef MAX_EV_N
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
#define MAX_EV_N 32
#endif
#define NETLINK_CRASHTOOL 27
#define ATTCHMT_ALIGN 4U
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
enum ct_ev_type {
 CT_EV_STAT,
 CT_EV_INFO,
 CT_EV_ERROR,
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
 CT_EV_CRASH,
 CT_EV_LAST
};
enum ct_attchmt_type {
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
 CT_ATTCHMT_DATA0,
 CT_ATTCHMT_DATA1,
 CT_ATTCHMT_DATA2,
 CT_ATTCHMT_DATA3,
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
 CT_ATTCHMT_DATA4,
 CT_ATTCHMT_DATA5,
 CT_ATTCHMT_BINARY,
 CT_ATTCHMT_FILELIST,
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
 CT_ATTCHMT_ADDITIONAL
};
#define CT_ADDITIONAL_NONE 0
#define CT_ADDITIONAL_APLOG (1<<0)
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
#define CT_ADDITIONAL_LAST_KMSG (1<<1)
#define CT_ADDITIONAL_FWMSG (1<<2)
struct ct_attchmt {
 __u32 size;
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
 enum ct_attchmt_type type;
 char data[];
} __aligned(4);
struct ct_event {
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
 __u64 timestamp;
 char submitter_name[MAX_SB_N];
 char ev_name[MAX_EV_N];
 enum ct_ev_type type;
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
 __u32 attchmt_size;
 __u32 flags;
 struct ct_attchmt attachments[];
} __aligned(4);
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
enum kct_nlmsg_type {
 KCT_EVENT,
 KCT_SET_PID = 4200,
};
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
struct kct_packet {
 struct nlmsghdr nlh;
 struct ct_event event;
};
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
#define ATTCHMT_ALIGNMENT 4
#ifndef KCT_ALIGN
#define __KCT_ALIGN_MASK(x, mask) (((x) + (mask)) & ~(mask))
#define __KCT_ALIGN(x, a) __KCT_ALIGN_MASK(x, (typeof(x))(a) - 1)
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
#define KCT_ALIGN(x, a) __KCT_ALIGN((x), (a))
#endif
#define foreach_attchmt(Event, Attchmt)   if ((Event)->attchmt_size)   for ((Attchmt) = (Event)->attachments;   (Attchmt) < (typeof(Attchmt))(((char *)   (Event)->attachments) +   (Event)->attchmt_size);   (Attchmt) = (typeof(Attchmt))KCT_ALIGN(((size_t)(Attchmt))   + sizeof(*(Attchmt)) +   (Attchmt)->size, ATTCHMT_ALIGNMENT))
#endif
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
